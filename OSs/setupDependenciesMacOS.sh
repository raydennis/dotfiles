# install zsh and oh-my-zsh
sudo apt-get install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
vim +BundleInstall +qall
~/.vim/bundle/fzf/install

# link the dotfiles
rm ~/.oh-my-zsh/themes/powerlevel9k
ln -s ~/Documents/GitHub/dotFiles/editors/vim/powerlevel9k ~/.oh-my-zsh/themes

rm ~/.oh-my-zsh/zsh-*
ln -s ~/Documents/GitHub/dotFiles/shells/zsh/zsh-autosuggestions ~/.oh-my-zsh/
ln -s ~/Documents/GitHub/dotFiles/shells/zsh/zsh-syntax-highlighting ~/.oh-my-zsh/

rm ~/.oh-my-zsh/custom/aliases.zsh
ln -s ~/Documents/GitHub/dotFiles/shells/zsh/aliases.zsh ~/.oh-my-zsh/custom

rm ~/z.sh
ln -s ~/Documents/GitHub/dotFiles/shells/zsh/z/z.sh ~/z.sh

rm ~/.vimrc
ln -s ~/Documents/GitHub/dotFiles/editors/vim/.vimrc ~/.vimrc

rm ~/.zshrc
ln -s ~/Documents/GitHub/dotFiles/shells/zsh/.zshrc ~/.zshrc


rm ~/notes
ln -s ~/Documents/gitHub/notes ~/notes


rm ~/.vim/colors/monokai.vim
mkdir ~/.vim/colors
ln -s ~/Documents/GitHub/dotFiles/editors/vim/vim-monokai/colors/monokai.vim ~/.vim/colors/monokai.vim

rm ~/.vim/colors/solarized.vim
ln -s ~/Documents/GitHub/dotFiles/editors/vim/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim

rm ~/.vim/colors/nord.vim
ln -s ~/Documents/GitHub/dotFiles/editors/vim/nord/nord-vim/colors/nord.vim ~/.vim/colors/nord.vim

rm -rf ~/.vim/templates
ln -s ~/Documents/GitHub/dotFiles/editors/vim/templates ~/.vim/templates

ln -s ~/Documents/GitHub/dotFiles/.gitconfig ~/.gitconfig
ln -s ~/Documents/GitHub/dotFiles/.gitignore_global ~/.gitignore_global
rm ~/.vim/spell/en.utf-8.add
ln -s ~/Documents/GitHub/dotFiles/editors/vim/en.utf-8.add ~/.vim/spell/en.utf-8.add

# setup dependencies for vscode
# on Mac or Linux (WSL = ?) type: 
# code --list-extensions | xargs -L 1 echo code --install-extension
# to get the following list
code --install-extension bbenoist.vagrant
code --install-extension eamodio.gitlens
code --install-extension ms-vscode.PowerShell
code --install-extension ms-vsts.team
code --install-extension robertohuertasm.vscode-icons
code --install-extension ryu1kn.partial-diff
code --install-extension vscodevim.vim
code --install-extension waderyan.gitblame
code --install-extension yzhang.dictionary-completion
code --install-extension yzhang.markdown-all-in-one
# To enable key-repeating execute the following in your Terminal and restart VS Code.
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
defaults delete -g ApplePressAndHoldEnabled
# now link to the user settings.json
ln -s ~/Documents/GitHub/dotFiles/editors/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

# brew
# brew install ansible cscope gdbm gettext git git-credential-manager glib gmp gnutls libevent libffi libtasn1 libunistring libyaml lua luajit macvim nettle nmap openconnect openssl p11-kit pcre pcre2 perl python readline ruby sqlite sshfs stoken terraform the_silver_searcher tree unbound vim xz z --HEAD universal-ctags/universal-ctags/universal-ctags emacs aspell imgur-screenshot.sh terminal-notifier

# emacs - spacemacs
# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d


