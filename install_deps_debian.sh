#!/bin/bash

# Update the package list
sudo apt-get update

# Install Node.js and npm
sudo apt-get install -y nodejs npm

# Install Yeoman and the VS Code Extension Generator
sudo npm install -g yo generator-code

# Install TypeScript
npm install --save-dev typescript

# Install the VS Code types
npm install --save-dev @types/vscode

echo "All necessary dependencies have been installed."
