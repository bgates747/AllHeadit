import * as vscode from 'vscode';

export function activate(context: vscode.ExtensionContext) {
    let disposable = vscode.commands.registerCommand('allheadit.helloWorld', () => {
        vscode.window.showInformationMessage('Hello World from AllHeadit!');
    });

    context.subscriptions.push(disposable);
}

export function deactivate() {}
