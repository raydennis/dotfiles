# install zsh
sudo apt-get install zsh -y

# get oh-my-zsh installed
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install nerdfont
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# link the dotfiles
rm ~/.oh-my-zsh/themes/powerlevel9k
ln -s ~/Documents/GitHub/dotFiles/editors/vim/powerlevel9k ~/.oh-my-zsh/themes

rm ~/.oh-my-zsh/zsh-*
ln -s ~/Documents/GitHub/dotFiles/shells/zsh/zsh-autosuggestions ~/.oh-my-zsh/
ln -s ~/Documents/GitHub/dotFiles/shells/zsh/zsh-syntax-highlighting ~/.oh-my-zsh/

rm ~/z.sh
ln -s ~/Documents/GitHub/dotFiles/shells/zsh/z/z.sh ~/z.sh

rm ~/.vimrc
ln -s ~/Documents/GitHub/dotFiles/editors/vim/.vimrc ~/.vimrc

rm ~/.zshrc
ln -s ~/Documents/GitHub/dotFiles/shells/zsh/.zshrc ~/.zshrc

rm ~/.vim/colors/monokai.vim
ln -s ~/Documents/GitHub/dotFiles/editors/vim/vim-monokai/colors/monokai.vim ~/.vim/colors/monokai.vim

rm ~/.vim/colors/solarized.vim
ln -s ~/Documents/GitHub/dotFiles/editors/vim/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim

ln -s ~/Documents/GitHub/dotFiles/.gitconfig ~/.gitconfig
ln -s ~/Documents/GitHub/dotFiles/.gitignore_global ~/.gitignore_global
rm ~/.vim/spell/en.utf-8.add
ln -s /mnt/c/Users/Ray/Documents/GitHub/dotFiles/editors/vim/en.utf-8.add ~/.vim/spell/en.utf-8.add

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
vim +BundleInstall +qall
~/.vim/bundle/fzf/install

# Python setup
# sudo pip install pep8 flake8 pyflakes isort yapf jedi 
