# install zsh
sudo apt-get install zsh -y

# get oh-my-zsh installed
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 

# link the dotfiles
ln -s ~/Documents/GitHub/dotFiles/powerlevel9k ~/.oh-my-zsh/themes
ln -s ~/Documents/GitHub/dotFiles/zsh-autosuggestions ~/.oh-my-zsh/
ln -s ~/Documents/GitHub/dotFiles/zsh-syntax-highlighting ~/.oh-my-zsh/
ln -s ~/Documents/GitHub/dotFiles/z/z.sh ~/z.sh
ln -s ~/Documents/GitHub/dotFiles/.vimrc ~/.vimrc
ln -s ~/Documents/GitHub/dotFiles/.zshrc ~/.zshrc
mkdir -p ~/.vim/colors
ln -s ~/Documents/GitHub/dotFiles/vim-monokai/colors/monokai.vim ~/.vim/colors/monokai.vim
ln -s ~/Documents/GitHub/dotFiles/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim
