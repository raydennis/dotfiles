# install zsh
brew install zsh z zsh-syntax-highlighting zsh-autosuggestions

rm ~/z.sh
ln -s ~/Github/dotfiles/shells/zsh/z/z.sh ~/z.sh

rm ~/.vimrc
ln -s ~/Github/dotfiles/editors/vim/.vimrc ~/.vimrc

rm ~/.vim/coc-settings.json
ln -s ~/Github/dotfiles/editors/vim/coc-settings.json ~/.vim/coc-settings.json

rm -rf ~/.vim/UltiSnips
ln -s ~/Github/dotfiles/editors/vim/ultisnips ~/.vim/UltiSnips

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

# git
rm ~/.gitconfig
ln -s ~/Github/dotfiles/.gitconfig ~/.gitconfig

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

rm ~/.gitignore_global
ln -s ~/Github/dotfiles/.gitignore_global ~/.gitignore_global

rm ~/.vim/spell/en.utf-8.add
ln -s ~/Github/dotfiles/editors/vim/en.utf-8.add ~/.vim/spell/en.utf-8.add

# brew
# brew install git git-credential-manager macvim nmap openconnect openssl python sshfs the_silver_searcher tree z aspell osxfuse 

# emacs - spacemacs
# brew cask install emacs
# git clone https://Github.com/syl20bnr/spacemacs ~/.emacs.d
# rm -rf ~/.spacemacs
# ln -s ~/gitHub/dotfiles/editors/emacs/.spacemacs ~/.spacemacs

# ranger
brew tap eddieantonio/eddieantonio
brew cask install xquartz macdown
brew install libcaca highlight atool lynx w3m elinks poppler transmission mediainfo exiftool ranger
sudo npm install ansimd -g
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

