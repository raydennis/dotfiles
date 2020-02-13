# setup dependencies for vscode
# on Mac or Linux (WSL = ?) type: 


# link to the user settings.json
rm ~/Library/Application\ Support/VSCodium/User/settings.json
rm ~/Library/Application\ Support/VSCodium/User/keybindings.json
ln -s ~/Github/dotfiles/editors/vscode/settings.json ~/Library/Application\ Support/VSCodium/User/settings.json
ln -s ~/Github/dotfiles/editors/vscode/keybindings.json ~/Library/Application\ Support/VSCodium/User/keybindings.json

code --list-extensions | xargs -L 1 echo code --install-extension
code --install-extension 2gua.rainbow-brackets
code --install-extension arcticicestudio.nord-visual-studio-code
code --install-extension christian-kohler.path-intellisense
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension esbenp.prettier-vscode
code --install-extension johnpapa.winteriscoming
code --install-extension ms-azure-devops.azure-pipelines
code --install-extension ms-azuretools.vscode-apimanagement
code --install-extension ms-azuretools.vscode-azureappservice
code --install-extension ms-azuretools.vscode-azurefunctions
code --install-extension ms-azuretools.vscode-azurestorage
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-mssql.mssql
code --install-extension ms-vscode.azure-account
code --install-extension ms-vscode.azurecli
code --install-extension ms-vscode.vscode-node-azure-pack
code --install-extension ms-vscode.vscode-typescript-tslint-plugin
code --install-extension ms-vsts.team
code --install-extension msazurermtools.azurerm-vscode-tools
code --install-extension PKief.material-icon-theme
code --install-extension ryu1kn.partial-diff
code --install-extension Sophisticode.php-formatter
code --install-extension vsciot-vscode.azure-iot-toolkit
code --install-extension vscodevim.vim
code --install-extension waderyan.gitblame
code --install-extension yzhang.dictionary-completion
code --install-extension yzhang.markdown-all-in-one

# To enable key-repeating execute the following in your Terminal and restart VS Code.
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false
defaults delete -g ApplePressAndHoldEnabled

