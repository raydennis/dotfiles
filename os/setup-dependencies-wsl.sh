# install zsh 
sudo apt-get install zsh -y

rm ~/.zshrc
ln -s ~/Github/dotfiles/shells/zsh/.zshrc ~/.zshrc

mkdir ~/.zsh/plugins

rm -rf ~/.zsh/plugins/zsh-autosuggestions
mkdir ~/.zsh/plugins/zsh-autosuggestions
ln -s ~/Github/dotfiles/shells/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


rm -rf ~/.zsh/plugins/zsh-syntax-highlighting
mkdir ~/.zsh/plugins/zsh-syntax-highlighting
ln -s ~/Github/dotfiles/shells/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

rm ~/z.sh
ln -s ~/Github/dotfiles/shells/zsh/z/z.sh ~/z.sh

rm ~/.vimrc
ln -s ~/Github/dotfiles/editors/vim/.vimrc ~/.vimrc

rm ~/.vim/coc-settings.json
ln -s ~/Github/dotfiles/editors/vim/coc-settings.json ~/.vim/coc-settings.json

rm -rf ~/.vim/UltiSnips
ln -s ~/Github/dotfiles/editors/vim/ultisnips ~/.vim/UltiSnips

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

# ranger
sudo apt install ranger
rm -rf ~/.config/ranger
ln -s ~/Github/dotfiles/shells/ranger ~/.config/ranger
git clone https://Github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

