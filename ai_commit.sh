#!/bin/bash

(
       # Check if config file exists in the same directory as the script
    CONFIG_FILE="$(dirname "$0")/config.txt"
    if [ ! -f "$CONFIG_FILE" ]; then
        echo "Config file 'config.txt' not found in the same directory as the script."
        exit 1
    fi

    # Source the config file to get the API key
    source "$CONFIG_FILE"

    # Define the Git diff command
    DIFF_CMD="git diff --cached"

    # Add changes to the staging area
    git add .

    # Execute the Git diff command and capture its output
    DIFF_OUTPUT="$($DIFF_CMD)"

    # Function to escape and format a string as JSON
    escape_to_json() {
        local string="$1"
        # Escape special characters: \, ", and /
        string="${string//\\/\\\\}"
        string="${string//\"/\\\"}"
        string="${string//\//\\/}"
        # Replace newlines with \n and tabs with \t
        string="${string//$'\n'/\\n}"
        string="${string//$'\t'/\\t}"
        echo "$string"
    }

    # Function to interact with GPT-3.5 and generate a commit message
    generate_commit_message() {
        local diff="$1"
        escaped_diff=$(escape_to_json "$diff")

        if [ -z "$OVERRIDE_PROMPT" ]; then
            local prompt="Write a short and descriptive commit message."
        else
            local prompt=$OVERRIDE_PROMPT
        fi

        # Construct the JSON request body
        request_body='{
            "model": "gpt-3.5-turbo",
            "messages": [
                {
                    "role": "system",
                    "content": "You are a helpful assistant that can take a git diff as input and provide a commit message of any style requested by the user. The response format should be <ai_commit_response>commit_message<\\ai_commit_response>"
                },
                {
                    "role": "user",
                    "content": "'$prompt'\n\ndiff:\n'$escaped_diff'"
                }
            ]
        }'
        
        # Call GPT-3.5 to generate a commit message
        response=$(curl -s -X POST "https://api.openai.com/v1/chat/completions" \
                            -H "Content-Type: application/json" \
                            -H "Authorization: Bearer $API_KEY" \
                            -d "$request_body")

        # Check if there was an error with the curl request
        if [ $? -ne 0 ]; then
            echo "Error occurred while making the API request."
            exit 1
        fi

        # Extract commit message from response
        commit_message=$(echo "$response" | grep -o '<ai_commit_response>[^<]*</ai_commit_response>' | sed 's/<ai_commit_response>//; s/<\/ai_commit_response>//')

        echo "$commit_message"
    }

    # Generate a commit message using GPT-3.5
    commit_msg=$(generate_commit_message "$DIFF_OUTPUT")

    echo "$commit_msg"
    read -p "Do you want to commit these changes with the above message? (y/n): " user_choice

    if [[ $user_choice == "y" || $user_choice == "Y" ]]; then
        git commit -m "$commit_msg"
        echo "Changes committed with the generated message."
    else
        echo "Changes not committed."
    fi
)
