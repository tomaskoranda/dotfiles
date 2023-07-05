# macOS manual setup notes

1. Fresh System Install
2. Update OS and Install developer tools

-   (developer tools include git which we need in the next step)
-   `GUI update OS`

-   ```zsh
    xcode-select --install
    ```
-   ```zsh
    sudo softwareupdate --list --verbose
    ```
-   ```zsh
    sudo softwareupdate --install --all  --verbose
    ```

3. Clone/Create a dotfiles repository

4. [Homebrew install](https://brew.sh)

-   install

    -   ```zsh
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        ```

-   Add brew to path
    -   ```zsh
        (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/korantom/.zprofile
        ```
    -   ```zsh
        eval "$(/opt/homebrew/bin/brew shellenv)"
        ```
-   Test homebrew
    -   ```zsh
        brew doctor
        ```

5. Install VSCode (or your editor of choice)

-   ```zsh
    brew install --cask visual-studio-code
    ```

6. Git config

-   Config your git locally, namely name and email (for this repository)
-   ```zsh
    git config user.name "<your_name_here>"
    ```
-   ```zsh
    git config user.email "<your_email_here>"
    ```

7. [Add dotbot as a submodule](https://github.com/anishathalye/dotbot#integrate-with-existing-dotfiles)

-   ```zsh
     git submodule add https://github.com/anishathalye/dotbot
    ```
-   ```zsh
     git config -f .gitmodules submodule.dotbot.ignore dirty
    ```
-   ```zsh
    cp dotbot/tools/git-submodule/install .
    ```
-   ```zsh
     touch install.conf.yaml
    ```

8. Customize your dotfiles

-   Add files to your dotfiles repository and:
    -   Link them to your home directory via the `install.conf.yaml` file
    -   Run install scripts via the `install.conf.yaml` file
