# install zsh and oh-my-zsh
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# link the dotfiles
rm ~/.oh-my-zsh/themes/powerlevel9k
ln -s ~/github/dotfiles/editors/vim/powerlevel9k ~/.oh-my-zsh/themes

rm ~/.oh-my-zsh/zsh-*
ln -s ~/github/dotfiles/shells/zsh/zsh-autosuggestions ~/.oh-my-zsh/
ln -s ~/github/dotfiles/shells/zsh/zsh-syntax-highlighting ~/.oh-my-zsh/

rm ~/.oh-my-zsh/custom/aliases.zsh
ln -s ~/github/dotfiles/shells/zsh/aliases.zsh ~/.oh-my-zsh/custom

rm ~/z.sh
ln -s ~/github/dotfiles/shells/zsh/z/z.sh ~/z.sh

rm ~/.vimrc
ln -s ~/github/dotfiles/editors/vim/.vimrc ~/.vimrc

rm ~/.vim/coc-settings.json
ln -s ~/github/dotfiles/editors/vim/coc-settings.json ~/.vim/coc-settings.json

rm -rf ~/.vim/UltiSnips
ln -s ~/github/dotfiles/editors/vim/ultisnips ~/.vim/plugged/UltiSnips


rm ~/.zshrc
ln -s ~/github/dotfiles/shells/zsh/.zshrc ~/.zshrc

rm ~/notes
ln -s ~/github/notes ~/notes

rm ~/.vim/colors/monokai.vim
mkdir ~/.vim/colors
ln -s ~/github/dotfiles/editors/vim/vim-monokai/colors/monokai.vim ~/.vim/colors/monokai.vim

rm ~/.vim/colors/solarized.vim
ln -s ~/github/dotfiles/editors/vim/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim

rm ~/.vim/colors/nord.vim
ln -s ~/github/dotfiles/editors/vim/nord/nord-vim/colors/nord.vim ~/.vim/colors/nord.vim

rm -rf ~/.vim/templates
ln -s ~/github/dotfiles/editors/vim/templates ~/.vim/templates

rm ~/.gitconfig
ln -s ~/github/dotfiles/.gitconfig ~/.gitconfig

rm ~/.gitignore_global
ln -s ~/github/dotfiles/.gitignore_global ~/.gitignore_global

rm ~/.vim/spell/en.utf-8.add
ln -s ~/github/dotfiles/editors/vim/en.utf-8.add ~/.vim/spell/en.utf-8.add

# setup dependencies for vscode
# on Mac or Linux (WSL = ?) type: 
# code --list-extensions | xargs -L 1 echo code --install-extension
# to get the following list
code --install-extension PKief.material-icon-theme
code --install-extension Sophisticode.php-formatter
code --install-extension bbenoist.vagrant
code --install-extension christian-kohler.path-intellisense
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension esbenp.prettier-vscode
code --install-extension johnpapa.winteriscoming
code --install-extension ms-python.python
code --install-extension ms-vscode.powershell
code --install-extension ms-vscode.vscode-typescript-tslint-plugin
code --install-extension ms-vsts.team
code --install-extension ryu1kn.partial-diff
code --install-extension vscodevim.vim
code --install-extension waderyan.gitblame
code --install-extension yzhang.dictionary-completion
code --install-extension yzhang.markdown-all-in-one


# code --install-extension nord
# To enable key-repeating execute the following in your Terminal and restart VS Code.
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false
defaults delete -g ApplePressAndHoldEnabled
# now link to the user settings.json
ln -s ~/github/dotfiles/editors/vscode/settings.json ~/Library/Application\ Support/VSCodium/User/settings.json
ln -s ~/github/dotfiles/editors/vscode/keybindings.json ~/Library/Application\ Support/VSCodium/User/keybindings.json

# brew
# brew install ansible cscope gdbm gettext git git-credential-manager glib gmp gnutls libevent libffi libtasn1 libunistring libyaml lua luajit macvim nettle nmap openconnect openssl p11-kit pcre pcre2 perl python readline ruby sqlite sshfs stoken terraform the_silver_searcher tree unbound vim xz z --HEAD universal-ctags/universal-ctags/universal-ctags aspell imgur-screenshot.sh terminal-notifier

# emacs - spacemacs
## brew cask install emacs
## git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
## ln -s ~/gitHub/dotfiles/editors/emacs/.spacemacs ~/.spacemacs

# ranger
brew tap eddieantonio/eddieantonio
brew install libcaca highlight atool lynx w3m elinks poppler transmission mediainfo exiftool imgcat
ln -s ~/gitHub/dotfiles/shells/ranger ~/.config/ranger
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons


# font
brew tap homebrew/cask-fonts
brew cask install font-firacode-nerd-font
