# install vim-gtk3
dnf install vim-gtk3 curl zsh silversearcher-ag wget zsh ctags npm -y

# Install nerdfont
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Fura Mono Regular Nerd Font Complete Mono.otf" https:
//GitHub.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%
20Code%20Regular%20Nerd%20Font%20Complete.otf

# setup zsh autosuggestisons
rm -rf ~/.zsh/plugins/zsh-autosuggestions
mkdir ~/.zsh/plugins/zsh-autosuggestions
ln -s /Repositoires/GitHub/dotfiles/shells/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# setup zsh-syntax-highlighting
rm -rf ~/.zsh/plugins/zsh-syntax-highlighting
mkdir ~/.zsh/plugins/zsh-syntax-highlighting
ln -s /Repositoires/GitHub/dotfiles/shells/zsh/zsh-syntax-highlighting/zsh-syntax-highlight
ing.zsh ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

rm ~/z.sh
ln -s /Repositoires/GitHub/dotfiles/shells/zsh/z/z.sh ~/z.sh

rm ~/.vimrc
ln -s /Repositoires/GitHub/dotfiles/editors/vim/.vimrc ~/.vimrc

rm ~/.zshrc
ln -s /Repositoires/GitHub/dotfiles/shells/zsh/.zshrc ~/.zshrc

mkdir ~/.vim/colors
rm ~/.vim/colors/monokai.vim
ln -s /Repositoires/GitHub/dotfiles/editors/vim/vim-monokai/colors/monokai.vim ~/.vim/color
s/monokai.vim

rm ~/.vim/colors/solarized.vim
ln -s /Repositoires/GitHub/dotfiles/editors/vim/vim-colors-solarized/colors/solarized.vim ~
/.vim/colors/solarized.vim

rm ~/.vim/colors/nord.vim
ln -s /Repositoires/GitHub/dotfiles/editors/vim/nord/nord-vim/colors/nord.vim ~/.vim/colors
/nord.vim

rm -rf ~/.vim/UltiSnips
ln -s /Repositoires/GitHub/dotfiles/editors/vim/ultisnips ~/.vim/UltiSnips

rm /Repositoires/GitHub/dotfiles/.gitconfig ~/.gitconfig
ln -s /Repositoires/GitHub/dotfiles/.gitconfig ~/.gitconfig
rm /Repositoires/GitHub/dotfiles/.gitignore_global ~/.gitignore_global
ln -s /Repositoires/GitHub/dotfiles/.gitignore_global ~/.gitignore_global

rm ~/.vim/spell/en.utf-8.add
ln -s /mnt/c/Users/Ray/GitHub/dotfiles/editors/vim/en.utf-8.add ~/.vim/spell/en.utf-8.add

# ranger
sudo dnf install ranger -y
rm -rf ~/.config/ranger
ln -s /Repositoires/GitHub/dotfiles/shells/ranger ~/.config/ranger
git clone https://GitHub.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ra
nger_devicons

# # Terminator setup
sudo dnf install terminator -y
mkdir ~/.config/terminator
rm ~/.config/terminator/config
ln -s /Repositoires/GitHub/dotfiles/shells/terminator/config ~/.config/terminator/


# Python setup
pip install pep8 flake8 pyflakes isort yapf jedi 

# replace capslock with escape
# vim /usr/share/X11/xkb/symbols/pc
# Comment out this line:
# // key <CAPS> {	[ Caps_Lock		]	};
# And add this line
# key <CAPS> {        [ Escape                ]       };


# setup zsh as default
# sudo usermod -s $(which zsh) $USER
