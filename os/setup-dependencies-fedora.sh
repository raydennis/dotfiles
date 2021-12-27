# install vim-gtk3
dnf install vim-gtk3 curl zsh silversearcher-ag wget zsh ctags npm -y

# Install nerdfont
mkdir -p ~/.fonts
cd ~/.local/share/fonts && curl -fLo "Fura Mono Regular Nerd Font Complete Mono.otf" https://Github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.otf

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# setup zsh autosuggestisons
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# setup zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-h

# setup powerlevel10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ~/powerlevel10k

rm ~/z.sh
ln -s ~/Repositories/GitHub/dotfiles/shells/zsh/z/z.sh ~/z.sh

rm ~/.vimrc
ln -s ~/Repositories/GitHub/dotfiles/editors/vim/.vimrc ~/.vimrc

rm ~/.zshrc
ln -s ~/Repositories/GitHub/dotfiles/shells/zsh/.zshrc ~/.zshrc


mkdir ~/.vim/colors
rm ~/.vim/colors/monokai.vim
ln -s ~/Repositories/GitHub/dotfiles/editors/vim/vim-monokai/colors/monokai.vim ~/.vim/colors/monokai.vim

rm ~/.vim/colors/solarized.vim
ln -s ~/Repositories/GitHub/dotfiles/editors/vim/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim

rm ~/.vim/colors/nord.vim
ln -s ~/Repositories/GitHub/dotfiles/editors/vim/nord/nord-vim/colors/nord.vim ~/.vim/colors/nord.vim

rm -rf ~/.vim/UltiSnips
ln -s ~/Repositories/GitHub/dotfiles/editors/vim/ultisnips ~/.vim/UltiSnips

ln -s ~/Repositories/GitHub/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/Repositories/GitHub/dotfiles/.gitignore_global ~/.gitignore_global

rm ~/.vim/coc-settings.json

ln -s ~/Repositories/GitHub/dotfiles/editors/vim/coc-settings.json ~/.vim/coc-settings.json

rm ~/.vim/spell/en.utf-8.add
ln -s /mnt/c/Users/Ray/Repositories/GitHub/dotfiles/editors/vim/en.utf-8.add ~/.vim/spell/en.utf-8.add

# ranger
sudo dnf install ranger
rm -rf ~/.config/ranger
ln -s ~/Repositories/GitHub/dotfiles/shells/ranger ~/.config/ranger
git clone https://Github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

# # Terminator setup
dnf-get install terminator
mkdir ~/.config/terminator
rm ~/.config/terminator/config
ln -s ~/Repositories/GitHub/dotfiles/shells/terminator/config ~/.config/terminator/


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
