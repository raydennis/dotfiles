# basics
sudo dnf -y install curl zsh the_silver_searcher wget ctags npm xclip fzf

# timezone

sudo timedatectl set-timezone "US\Mountain"
# font
cd ~/.local/share/fonts && curl -fLo "Fura Mono Regular Nerd Font Complete Mono.otf" https://GitHub.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.otf

# neovim
sudo dnf -y copr enable agriffis/neovim-nightly
sudo dnf -y install neovim python3-neovim fd-find ripgrep gcc-c++
mkdir -p ~/.config/nvim
rm ~/.config/nvim/init.lua
ln -s ~/Repositories/GitHub/raydennis/dotfiles/editors/neovim/init.lua ~/.config/nvim/init.lua
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/Repositories/GitHub/raydennis/dotfiles/editors/neovim/snippets ~/.config/nvim/snippets


# zsh
## oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## zsh and zshrc
sudo dnf -y install zsh 
rm ~/.zshrc
ln -s ~/Repositories/GitHub/raydennis/dotfiles/shells/zsh/.zshrc ~/.zshrc

# Powerlevel 10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# zsh autosuggestions
rm -rf ~/.zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh syntax highlighting
rm -rf ~/.zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh syntax history
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# z.sh
rm ~/z.sh
ln -s ~/Repositories/GitHub/raydennis/dotfiles/shells/zsh/z/z.sh ~/z.sh

# git
rm ~/.gitconfig_global
ln -s ~/Repositories/GitHub/raydennis/dotfiles/.gitconfig ~/.gitconfig
rm ~/.gitignore_global
ln -s ~/Repositories/GitHub/raydennis/dotfiles/.gitignore_global ~/.gitignore_global

# spelling
rm ~/.vim/spell/en.utf-8.add
mkdir -p ~/.vim/spell/
ln -s ~/Repositories/GitHub/raydennis/dotfiles/editors/vim/en.utf-8.add ~/.vim/spell/en.utf-8.add

# ranger
sudo dnf -y install ranger
rm -rf ~/.config/ranger
ln -s ~/Repositories/GitHub/raydennis/dotfiles/shells/ranger ~/.config/ranger
git clone https://GitHub.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ra
nger_devicons

# tmux
sudo dnf -y install tmux
rm ~/.tmux.conf
ln -s ~/Repositories/GitHub/raydennis/dotfiles/shells/tmux/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# env
rm ~/.env
ln -s ~/Repositories/GitHub/raydennis/dotfiles/os/.env ~/.env

# google-chrome
sudo dnf -y install google-chrome-unstable
cp /usr/share/applications/google-chrome-unstable.desktop ~/.local/share/applications
echo "Manual settings required for google chrome:"
echo "about://flags → Preferred Ozone platform → Wayland"
echo "about://flags → Pull-to-refresh gesture → Enabled"

# kitty
sudo dnf -y install kitty
pip install Pillow
rm -rf ~/.config/kitty/theme
rm ~/.config/kitty/kitty.conf
ln -s ~/Repositories/GitHub/raydennis/dotfiles/shells/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s ~/Repositories/GitHub/raydennis/dotfiles/shells/kitty/themes ~/.config/kitty/themes

# Python setup
pip install pep8 flake8 pyflakes isort yapf jedi
sudo dnf -y install snapd
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install prettier --beta

# yaml-language-server
sudo snap install yaml-language-server

# replace capslock with escape
# install gnome tweak tools > alternate layouts > swap esc and caps

# setup zsh as default
sudo dnf install -y util-linux-user
sudo usermod -s $(which zsh) $USER

# key-mapper
# sudo pip uninstall evdev

# keyboard (for qmk)
# ln -s /home/rdennis/Repositories/GitHub/raydennis/dotfiles/keyboard/iris/keymap.c ~/Repositories/GitHub/qmk/qmk_firmware/keyboards/keebio/iris/keymaps/raydennis/keymap.c

