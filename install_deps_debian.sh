#!/bin/bash

# Define function for installing global packages
install_global_packages() {
    echo "Installing global packages..."
    sudo npm install -g yo generator-code vsce typescript npm-check-updates
}

# Define function for installing local development dependencies
install_local_packages() {
    echo "Installing local development packages..."
    npm install --save-dev typescript @types/vscode eslint prettier eslint-config-prettier eslint-plugin-prettier jest @types/jest ts-jest eslint-plugin-jest husky
}

# Define function for initializing tools
initialize_tools() {
    echo "Initializing ESLint and Jest..."
    npx eslint --init
    npx ts-jest config:init
    npx husky install
    npx husky add .husky/pre-commit "npm run lint"
}

# Define function for updating npm packages
update_packages() {
    echo "Updating packages..."
    ncu -u
    npm install
}

# Define function for cleaning npm cache and node_modules
clean_install() {
    echo "Cleaning npm cache and node_modules..."
    npm cache clean --force
    rm -rf node_modules
    npm install
}

echo "Welcome to the VS Code Extension setup script!"

# Ask for global or local installation
read -p "Do you want to install packages globally or locally? [global/local] " install_type

# Ask for clean or incremental installation
read -p "Do you want a clean install or an incremental install? [clean/incremental] " install_method

# Update package list
sudo apt-get update

# Install Node.js and npm if not already installed
sudo apt-get install -y nodejs npm

# Initialize a new npm package if not already done
npm init -y

# Process installation type and method
if [[ $install_type == "global" ]]; then
    install_global_packages
    if [[ $install_method == "clean" ]]; then
        sudo npm uninstall -g yo generator-code vsce typescript npm-check-updates
        install_global_packages
    fi
elif [[ $install_type == "local" ]]; then
    if [[ $install_method == "clean" ]]; then
        clean_install
    else
        install_local_packages
    fi
    initialize_tools
fi

# Update packages if incremental installation is chosen
if [[ $install_method == "incremental" ]]; then
    update_packages
fi

# Additional option for global installation users
if [[ $install_type == "global" ]]; then
    read -p "Do you want to remove all locally installed packages? [y/n] " clean_local
    if [[ $clean_local == "y" ]]; then
        echo "Removing local packages..."
        npm uninstall --save-dev typescript @types/vscode eslint prettier eslint-config-prettier eslint-plugin-prettier jest @types/jest ts-jest eslint-plugin-jest husky
    fi
fi

echo "Setup complete!"
