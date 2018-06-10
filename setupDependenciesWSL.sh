# install zsh
sudo apt-get install zsh -y

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
vim +BundleInstall +qall
~/.vim/bundle/fzf/install

# get oh-my-zsh installed
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s /mnt/c/Users/Ray/Documents/GitHub/dotFiles/powerlevel9k ~/.oh-my-zsh/themes/powerlevel9k
ln -s /mnt/c/Users/Ray/Documents/GitHub/dotFiles/zsh-autosuggestions ~/.oh-my-zsh/
ln -s /mnt/c/Users/Ray/Documents/GitHub/dotFiles/zsh-syntax-highlighting ~/.oh-my-zsh/
ln -s /mnt/c/Users/Ray/Documents/GitHub/dotFiles/z/z.sh /home/ray/z.sh
rm ~/.vimrc
ln -s /mnt/c/Users/Ray/Documents/GitHub/dotFiles/.vimrc ~/.vimrc
rm ~/.zshrc
ln -s /mnt/c/Users/Ray/Documents/GitHub/dotFiles/.zshrc ~/.zshrc
mkdir -p ~/.vim/colors
ln -s /mnt/c/Users/Ray/Documents/GitHub/dotFiles/vim-monokai/colors/monokai.vim ~/.vim/colors/monokai.vim
ln -s ~/mnt/c/Users/Ray/Documents/GitHub/dotFiles/en.utf-8.add ~/.vim/spell/en.utf-8.add
