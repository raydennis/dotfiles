# install zsh
sudo apt-get install zsh -y

# get oh-my-zsh installed
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
vim +BundleInstall +qall
~/.vim/bundle/fzf/install

# link the dotfiles
ln -s ~/Documents/GitHub/dotFiles/powerlevel9k ~/.oh-my-zsh/themes/powerlevel9k
ln -s ~/Documents/GitHub/dotFiles/zsh-autosuggestions ~/.oh-my-zsh/
ln -s ~/Documents/GitHub/dotFiles/zsh-syntax-highlighting ~/.oh-my-zsh/
ln -s ~/Documents/GitHub/dotFiles/z/z.sh ~/z.sh
rm ~/.vimrc
ln -s ~/Documents/GitHub/dotFiles/.vimrc ~/.vimrc
rm ~/.zshrc
ln -s ~/Documents/GitHub/dotFiles/.zshrc ~/.zshrc
mkdir -p ~/.vim/colors
ln -s ~/Documents/GitHub/dotFiles/vim-monokai/colors/monokai.vim ~/.vim/colors/monokai.vim
ln -s ~/Documents/GitHub/dotFiles/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim
ln -s ~/Documents/GitHub/dotFiles/en.utf-8.add ~/.vim/spell/en.utf-8.add

# Python setup
sudo pip install pep8 flake8 pyflakes isort yapf jedi 
