#!/bin/bash

# Check if fzf is installed
if ! command -v fzf &> /dev/null
then
    echo "Error: fzf is not installed. Please install fzf and try again."
    exit 1
fi

# Check if the bundle ID is passed as an argument
if [ -z "$1" ]; then
    echo "Error: No bundle ID provided. Usage: ./simudef.sh <bundle_id>"
    exit 1
fi

# Bundle ID from the command-line argument
BUNDLE_ID=$1

# 1. List booted simulators and filter lines with `(Booted)`, then remove `(Booted)`
SIMULATOR=$(xcrun simctl list devices | grep "(Booted)" | sed 's/ (Booted)//' | fzf --prompt="Select a simulator: ")

# 2. Extract the simulator ID (the string inside the first parentheses from the right)
SIMULATOR_ID=$(echo "$SIMULATOR" | sed 's/.*(\(.*\)).*/\1/')

# 3. Extract the simulator name (everything before the first parentheses from the right)
SIMULATOR_NAME=$(echo "$SIMULATOR" | sed 's/^(.*)//g' | sed "s/ ($SIMULATOR_ID)//")

# Check if a simulator was selected
if [ -z "$SIMULATOR_ID" ]; then
    echo "No simulator selected or no booted simulators found."
    exit 1
fi

echo "Selected Simulator: $SIMULATOR_NAME"
echo "Simulator ID: $SIMULATOR_ID"

# 4. Open the simulator's device directory and search for the `.plist` file
SIMULATOR_DIR=$HOME/Library/Developer/CoreSimulator/Devices/$SIMULATOR_ID/

# Search for the specific plist file and open its location
find "$SIMULATOR_DIR" -iname "$BUNDLE_ID.plist" -exec open {} \;
