# get oh-my-zsh installed
h -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# link the dotfiles
ln -s ~/Documents/GitHub/dotFiles/powerlevel9k ~/.oh-my-zsh/themes
ln -s ~/Documents/GitHub/dotFiles/zsh-autosuggestions ~/.oh-my-zsh/
ln -s ~/Documents/GitHub/dotFiles/zsh-syntax-highlighting ~/.oh-my-zsh/
ln -s ~/Documents/GitHub/dotFiles/z/z.sh ~/z.sh
ln -s ~/Documents/GitHub/dotFiles/.vimrc ~/.vimrc
ln -s ~/Documents/GitHub/dotFiles/.zshrc ~/.zshrc
ln -s ~/Documents/GitHub/dotFiles/vim-monokai/colors/monokai.vim ~/.vim/colors/monokai.vim
ln -s ~/Documents/GitHub/dotFiles/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim

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
# now link to the user settings.json
ln -s ~/Documents/GitHub/dotFiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
