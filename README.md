# simudef
## Easily edit user defaults of running simulators!
`simudef` (simulator UserDefaults) is a simple bash script for editing user defaults on running iOS/iPad simulators. It allows you to quickly search for and select a running simulator using `fzf`, then locate and open the specific `.plist` file associated with an app (based on its bundle ID) for editing.

![screenshot](assets/screenshot.png)

## Features

- **Fuzzy search**: `simudef` uses `fzf` to present a list of booted simulators, allowing you to type and filter results quickly.
- **Easy navigation**: You can use arrow keys to navigate through the list of simulators or type part of the name to filter results.
- **Command-line arguments**: You provide the app's **bundle ID** as a command-line argument, and `simudef` searches for the corresponding `.plist` file in the selected simulator’s data directory.

## Installation

1. Clone or download the script.
2. Make sure `fzf` is installed. You can install `fzf` using Homebrew:

    ```bash
    brew install fzf
    ```

3. Ensure the script has execution permissions:

    ```bash
    chmod +x simudef.sh
    ```

## Usage

### Basic Example:

To use the script, call it with your app's bundle ID as follows:

```bash
./simudef.sh <bundle_id>
```

The script will:

1.	Present a list of booted simulators using fzf.
2.	Allow you to filter or navigate through the simulators.
3.	After you select a simulator, the script will open the .plist file associated with the provided bundle ID.


## Adding an Alias

To make it easier to run `simudef` from anywhere, you can create an alias in your shell configuration file (such as `.zshrc` or `.bashrc`).

For example, if you're using `zsh`, add the following line to your `.zshrc`:

```bash
echo "alias simudef=<path to the script>" >> ~/.zshrc