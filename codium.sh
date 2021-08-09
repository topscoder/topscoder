#!/bin/bash


# VSCodium extensions
# https://code.visualstudio.com/docs/editor/command-line
codium --install-extension "formulahendry.auto-close-tag" --force;
codium --install-extension "formulahendry.auto-rename-tag" --force;
codium --install-extension "aaron-bond.better-comments" --force;
codium --install-extension "CoenraadS.bracket-pair-colorizer" --force;
codium --install-extension "ryu1kn.partial-diff" --force;
codium --install-extension "ahmadawais.emoji-log-vscode" --force;
codium --install-extension "miguelsolorio.fluent-icons" --force;
codium --install-extension "eamodio.gitlens" --force;
codium --install-extension "oderwat.indent-rainbow" --force;
codium --install-extension "isudox.vscode-jetbrains-keybindings" --force;
codium --install-extension "ms-python.python" --force;
codium --install-extension "svipas.prettier-plus" --force;
codium --install-extension "Shan.code-settings-sync" --force;
codium --install-extension "TabNine.tabnine-vscode" --force;
codium --install-extension "jgclark.vscode-todo-highlight" --force;
codium --install-extension "rangav.vscode-thunder-client" --force;

curl https://marketplace.visualstudio.com/_apis/public/gallery/publishers/liviuschera/vsextensions/noctis/10.40.0/vspackage --output liviuschera.noctis.vsix;
codium --install-extension liviuschera.noctis.vsix --force;