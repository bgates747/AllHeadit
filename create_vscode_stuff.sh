#!/bin/bash

# Create .vscode directory if it doesn't already exist
mkdir -p .vscode

# Create base files
touch .vscode/settings.json .vscode/launch.json .vscode/tasks.json

echo ".vscode directory and base configuration files have been set up."
