#!/bin/bash

# Define the root source directory
src_dir="./src"

# Create the directory structure
mkdir -p $src_dir/commands

# Create the main extension file
cat <<EOF >$src_dir/extension.ts
import * as vscode from 'vscode';

export function activate(context: vscode.ExtensionContext) {
    let disposable = vscode.commands.registerCommand('allheadit.helloWorld', () => {
        vscode.window.showInformationMessage('Hello World from AllHeadit!');
    });

    context.subscriptions.push(disposable);
}

export function deactivate() {}
EOF

# Create the package.json contribution entry
cat <<EOF >$src_dir/package.json
{
    "name": "allheadit",
    "displayName": "AllHeadit",
    "description": "Hello World example for AllHeadit",
    "version": "0.0.1",
    "engines": {
        "vscode": "^1.58.0"
    },
    "categories": ["Other"],
    "activationEvents": [
        "onCommand:allheadit.helloWorld"
    ],
    "main": "./out/extension.js",
    "contributes": {
        "commands": [
            {
                "command": "allheadit.helloWorld",
                "title": "Hello World"
            }
        ]
    },
    "scripts": {
        "vscode:prepublish": "tsc -p ./",
        "watch": "tsc -watch -p ./",
        "postinstall": "node ./node_modules/vsce/out/npmPostinstall.js"
    },
    "devDependencies": {
        "typescript": "^4.0.0",
        "vscode": "^1.1.37",
        "eslint": "^7.32.0",
        "vsce": "^1.95.0"
    }
}
EOF

echo "Source files created. You can now build and run your extension."
