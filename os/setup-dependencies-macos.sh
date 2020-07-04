# install zsh
brew install zsh z zsh-syntax-highlighting zsh-autosuggestions

rm ~/z.sh
ln -s ~/Repositories/Github/raydennis/dotfiles/shells/zsh/z/z.sh ~/z.sh

rm ~/.vimrc
ln -s ~/Repositories/Github/raydennis/dotfiles/editors/vim/.vimrc ~/.vimrc

rm ~/.vim/coc-settings.json
ln -s ~/Repositories/Github/raydennis/dotfiles/editors/vim/coc-settings.json ~/.vim/coc-settings.json

rm -rf ~/.config/nvim
ln -s ~/Repositories/Github/raydennis/dotfiles/editors/neovim ~/.config/nvim

rm -rf ~/.vim/UltiSnips
ln -s ~/Repositories/Github/raydennis/dotfiles/editors/vim/ultisnips ~/.vim/UltiSnips

rm ~/.zshrc
ln -s ~/Repositories/Github/raydennis/dotfiles/shells/zsh/.zshrc ~/.zshrc

rm -rf ~/notes
ln -s ~/Repositories/Github/raydennis/notes ~/notes

rm ~/.vim/colors/monokai.vim
mkdir ~/.vim/colors
ln -s ~/Repositories/Github/raydennis/dotfiles/editors/vim/vim-monokai/colors/monokai.vim ~/.vim/colors/monokai.vim

rm ~/.vim/colors/solarized.vim
ln -s ~/Repositories/Github/raydennis/dotfiles/editors/vim/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim

rm ~/.vim/colors/nord.vim
ln -s ~/Repositories/Github/raydennis/dotfiles/editors/vim/nord/nord-vim/colors/nord.vim ~/.vim/colors/nord.vim

rm ~/.ideavimrc
ln -s ~/Repositories/Github/raydennis/dotfiles/editors/IntellijIdea/.ideavimrc ~/.ideavimrc

# git
rm ~/.gitconfig
ln -s ~/Repositories/Github/raydennis/dotfiles/.gitconfig ~/.gitconfig

rm ~/.gitignore_global
ln -s ~/Repositories/Github/raydennis/dotfiles/.gitignore ~/.gitignore_global

## git-madge
### Dependencies

### Requires that madge and jq are on your path:

brew install npm yarn
# sudo npm install -g madge
# brew install jq

### If we want to use any of the visual features, we'll also need graphviz:

# brew install graphviz

### If you're using iTerm2 and you want to display images in the terminal, install imgcat:

brew install imgcat

### Installation

### Copy the git-madge file to your path. Alternatively, using Homebrew:

# brew install jez/formulae/git-madge


rm ~/.vim/spell/en.utf-8.add
ln -s ~/Repositories/Github/raydennis/dotfiles/editors/vim/en.utf-8.add ~/.vim/spell/en.utf-8.add

# brew
# brew install git git-credential-manager macvim nmap openconnect openssl python sshfs the_silver_searcher tree z aspell osxfuse 

# emacs - spacemacs
# brew cask install emacs
# git clone https://Repositories/Github/raydennis.com/syl20bnr/spacemacs ~/.emacs.d
# rm -rf ~/.spacemacs
# ln -s ~/gitHub/dotfiles/editors/emacs/.spacemacs ~/.spacemacs

# ranger
brew tap eddieantonio/eddieantonio
brew cask install xquartz macdown
brew install libcaca highlight atool lynx w3m elinks poppler transmission mediainfo exiftool ranger
sudo npm install ansimd -g
rm -rf ~/.config/ranger
ln -s ~/Repositories/Github/raydennis/dotfiles/shells/ranger ~/.config/ranger
git clone https://Repositories/Github/raydennis.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

# font
brew tap homebrew/cask-fonts
brew cask install font-firacode-nerd-font

# gitk theme
rm -rf ~/.config/git/gitk
mkdir -p ~/.config/git
cp ~/Repositories/Github/raydennis/dotfiles/tools/gitk/gitk ~/.config/git/

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

# To enable key-repeating execute the following in your Terminal and restart VS Code.
# defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
# defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
# defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false
# defaults delete -g ApplePressAndHoldEnabled

# now link to the user settings.json
# rm ~/Library/Application\ Support/VSCodium/User/settings.json
# rm ~/Library/Application\ Support/VSCodium/User/keybindings.json
# ln -s ~/Repositories/Github/raydennis/dotfiles/editors/vscode/settings.json ~/Library/Application\ Support/VSCodium/User/settings.json
# ln -s ~/Repositories/Github/raydennis/dotfiles/editors/vscode/keybindings.json ~/Library/Application\ Support/VSCodium/User/keybindings.json
