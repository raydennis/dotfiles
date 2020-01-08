# install zsh
brew install zsh z zsh-syntax-highlighting zsh-autosuggestions

rm ~/z.sh
ln -s ~/Github/dotfiles/shells/zsh/z/z.sh ~/z.sh

rm ~/.vimrc
ln -s ~/Github/dotfiles/editors/vim/.vimrc ~/.vimrc

rm ~/.vim/coc-settings.json
ln -s ~/Github/dotfiles/editors/vim/coc-settings.json ~/.vim/coc-settings.json

rm -rf ~/.vim/UltiSnips
ln -s ~/Github/dotfiles/editors/vim/ultisnips ~/.vim/plugged/UltiSnips

rm ~/.zshrc
ln -s ~/Github/dotfiles/shells/zsh/.zshrc ~/.zshrc

rm -rf ~/notes
ln -s ~/Github/notes ~/notes

rm ~/.vim/colors/monokai.vim
mkdir ~/.vim/colors
ln -s ~/Github/dotfiles/editors/vim/vim-monokai/colors/monokai.vim ~/.vim/colors/monokai.vim

rm ~/.vim/colors/solarized.vim
ln -s ~/Github/dotfiles/editors/vim/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim

rm ~/.vim/colors/nord.vim
ln -s ~/Github/dotfiles/editors/vim/nord/nord-vim/colors/nord.vim ~/.vim/colors/nord.vim

rm ~/.gitconfig
ln -s ~/Github/dotfiles/.gitconfig ~/.gitconfig

rm ~/.gitignore_global
ln -s ~/Github/dotfiles/.gitignore_global ~/.gitignore_global

rm ~/.vim/spell/en.utf-8.add
ln -s ~/Github/dotfiles/editors/vim/en.utf-8.add ~/.vim/spell/en.utf-8.add

# # setup dependencies for vscode
# on Mac or Linux (WSL = ?) type: 
# code --list-extensions | xargs -L 1 echo code --install-extension
# code --install-extension 2gua.rainbow-brackets
# code --install-extension arcticicestudio.nord-visual-studio-code
# code --install-extension bbenoist.vagrant
# code --install-extension calebporzio.better-phpunit
# code --install-extension christian-kohler.path-intellisense
# code --install-extension dbaeumer.vscode-eslint
# code --install-extension eamodio.gitlens
# code --install-extension esbenp.prettier-vscode
# code --install-extension humao.rest-client
# code --install-extension ikappas.composer
# code --install-extension johnpapa.winteriscoming
# code --install-extension ms-azure-devops.azure-pipelines
# code --install-extension ms-azuretools.vscode-apimanagement
# code --install-extension ms-azuretools.vscode-azureappservice
# code --install-extension ms-azuretools.vscode-azurefunctions
# code --install-extension ms-azuretools.vscode-azurestorage
# code --install-extension ms-azuretools.vscode-cosmosdb
# code --install-extension ms-azuretools.vscode-docker
# code --install-extension ms-mssql.mssql
# code --install-extension ms-python.python
# code --install-extension ms-vscode.azure-account
# code --install-extension ms-vscode.azurecli
# code --install-extension ms-vscode.powershell
# code --install-extension ms-vscode.vscode-node-azure-pack
# code --install-extension ms-vscode.vscode-typescript-tslint-plugin
# code --install-extension ms-vsts.team
# code --install-extension msazurermtools.azurerm-vscode-tools
# code --install-extension PKief.material-icon-theme
# code --install-extension ryu1kn.partial-diff
# code --install-extension Sophisticode.php-formatter
# code --install-extension vsciot-vscode.azure-iot-toolkit
# code --install-extension vscodevim.vim
# code --install-extension waderyan.gitblame
# code --install-extension yzhang.dictionary-completion
# code --install-extension yzhang.markdown-all-in-one

# # To enable key-repeating execute the following in your Terminal and restart VS Code.
# defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
# defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
# defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false
# defaults delete -g ApplePressAndHoldEnabled

# now link to the user settings.json
# ln -s ~/Github/dotfiles/editors/vscode/settings.json ~/Library/Application\ Support/VSCodium/User/settings.json
# ln -s ~/Github/dotfiles/editors/vscode/keybindings.json ~/Library/Application\ Support/VSCodium/User/keybindings.json

# brew
# brew install git git-credential-manager macvim nmap openconnect openssl python sshfs the_silver_searcher tree z aspell osxfuse 

# emacs - spacemacs
# brew cask install emacs
# git clone https://Github.com/syl20bnr/spacemacs ~/.emacs.d
# rm -rf ~/.spacemacs
# ln -s ~/gitHub/dotfiles/editors/emacs/.spacemacs ~/.spacemacs

# ranger
brew tap eddieantonio/eddieantonio
brew install libcaca highlight atool lynx w3m elinks poppler transmission mediainfo exiftool imgcat
rm -rf ~/.config/ranger
ln -s ~/gitHub/dotfiles/shells/ranger ~/.config/ranger
git clone https://Github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

# font
brew tap homebrew/cask-fonts
brew cask install font-firacode-nerd-font

# gitk theme
rm -rf ~/.config/git/gitk
mkdir -p ~/.config/git
cp ~/Github/dotfiles/tools/gitk/gitk ~/.config/git/
