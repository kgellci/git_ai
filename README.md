# Git AI Commit Messages

Harness the power of AI to generate meaningful commit messages for your Git repository. Say goodbye to writing mundane commit messages and let ChatGPT take care of it for you!

![git_ai](https://github.com/kgellci/git_ai/assets/2548953/1db98ec6-1953-4ffa-8fbe-b23ad267b9a7)

## Introduction

In software development, writing clear and concise commit messages is essential for maintaining a well-organized and understandable version history. With the Git AI Commit Messages script, you can automate the process of generating commit messages using the advanced capabilities of the GPT-3.5 language model from OpenAI.

## Prerequisites

Before using the script, make sure you have the following:

1. An API key from OpenAI: To interact with the GPT-3.5 model and generate commit messages, you'll need an API key. This key should be stored in a `config.txt` file located in the same directory as the `ai_commit.sh` script.

2. Git: Ensure you have Git installed and configured on your system.

## Usage

1. Clone this repository to your local machine.

2. Obtain an API key from OpenAI and place it in a file named `config.txt` in the same directory as the `ai_commit.sh` script.
	```txt
	API_KEY="..."
	```

3. Make the `ai_commit.sh` script executable:

    ```bash
    chmod +x ai_commit.sh
    ```

4. Stage your changes using Git:

    ```bash
    git add .
    ```

5. Run the script:

    ```bash
    ./ai_commit.sh
    ```

6. The script will generate a commit message based on the changes you've staged. It will present the message to you and ask if you want to proceed with the generated message.

7. If you choose to commit the changes with the generated message, the script will automatically create a commit using Git with the generated commit message.

### config.txt

1. Create a file named `config.txt` in the same directory as the script.

2. Open `config.txt` in a text editor and any of the supported keys:

    ```txt
    # (required) OpenAI API key
    API_KEY="your_actual_api_key_here"

    # (optional) Override for the ai prompt
    OVERRIDE_PROMPT="Write your custom commit message prompt here such as: Write a commit message using only emoji's for the given diff."
    ```

## Adding an Alias (Optional)

Please note that the alias is completely optional, but it can save you even more time by providing a shorter and more memorable command for generating AI-generated commit messages.

### Git alias

To make running the `ai_commit.sh` script even easier, you can set up a Git alias that maps to the script. This way, you can use a shorter command to invoke the script whenever you want to generate a commit message.

1. Open your terminal and navigate to your home directory by running:

    ```bash
    cd ~
    ```

2. Open or create the `.gitconfig` file (if it doesn't exist) using a text editor of your choice:

    ```bash
    nano .gitconfig
    ```

3. Add the following lines to the `.gitconfig` file to create the alias:

    ```bash
    [alias]
        ai-commit = !/path/to/ai_commit.sh
    ```

    Replace `/path/to` with the actual path to the directory containing the `ai_commit.sh` script.

4. Save and exit the text editor.

5. Now you can use the alias to generate commit messages. From within your repository directory, simply run:

    ```bash
    git ai-commit
    ```

    The script will be executed, and you'll be guided through the process of generating and committing a message.

### Zsh

1. Open your terminal.

2. Edit your Zsh configuration file:

    ```bash
    nano ~/.zshrc
    ```

3. Add the following lines to create the alias:

    ```bash
    alias git-ai-commit='/path/to/ai_commit.sh'
    ```

    Replace `/path/to` with the actual path to the directory containing the `ai_commit.sh` script.

4. Save and exit the text editor.

5. Apply the changes:

    ```bash
    source ~/.zshrc
    ```

6. Now you can use the alias to generate commit messages:

    ```bash
    git-ai-commit
    ```

### Bash or Other Terminals

1. Open your terminal.

2. Edit your shell configuration file (e.g., `.bashrc`, `.bash_profile`, or `.profile`):

    ```bash
    nano ~/.bashrc
    ```

3. Add the following lines to create the alias:

    ```bash
    alias git-ai-commit='/path/to/ai_commit.sh'
    ```

    Replace `/path/to` with the actual path to the directory containing the `ai_commit.sh` script.

4. Save and exit the text editor.

5. Apply the changes:

    ```bash
    source ~/.bashrc
    ```

6. Now you can use the alias to generate commit messages:

    ```bash
    git-ai-commit
    ```

## Customization

Feel free to modify the script according to your needs. You can adjust the prompts, the model used for text generation, and the formatting of commit messages. The script provides a foundation for integrating AI-generated commit messages into your workflow.


## Disclaimer

Remember that while AI-generated commit messages can save time, they might not always capture the full context of your changes. It's recommended to review and, if necessary, modify the generated messages to ensure accurate and meaningful version history.

## Contributing

Contributions to this project are welcome! If you have ideas for improvements, new features, or bug fixes, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

---

You're all set to streamline your Git commit message workflow with the Git AI Commit Messages script. Enjoy writing code while the AI takes care of your commit messages!
