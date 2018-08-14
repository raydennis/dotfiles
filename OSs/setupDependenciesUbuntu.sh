# install vim-gtk3
sudo apt install vim-gtk3 -y

# install curl
sudo apt install curl -y

# install zsh
sudo apt-get install zsh -y

# get oh-my-zsh installed
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install nerdfont
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
cd ~/.local/share/fonts && curl -fLo "Fura Mono Regular Nerd Font Complete Mono.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# link the dotfiles
rm ~/.oh-my-zsh/themes/powerlevel9k
ln -s ~/Documents/GitHub/dotFiles/editors/vim/powerlevel9k ~/.oh-my-zsh/themes

rm ~/.oh-my-zsh/custom/aliases.zsh
ln -s ~/Documents/GitHub/dotFiles/shells/zsh/aliases.zsh ~/.oh-my-zsh/custom

rm ~/.oh-my-zsh/zsh-*
ln -s ~/Documents/GitHub/dotFiles/shells/zsh/zsh-autosuggestions ~/.oh-my-zsh/
ln -s ~/Documents/GitHub/dotFiles/shells/zsh/zsh-syntax-highlighting ~/.oh-my-zsh/

rm ~/z.sh
ln -s ~/Documents/GitHub/dotFiles/shells/zsh/z/z.sh ~/z.sh

rm ~/.vimrc
ln -s ~/Documents/GitHub/dotFiles/editors/vim/.vimrc ~/.vimrc

rm ~/.zshrc
ln -s ~/Documents/GitHub/dotFiles/shells/zsh/.zshrc ~/.zshrc

mkdir ~/.vim/colors
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

# Terminator setup
sudo apt-get install terminator
mkdir ~/.config/terminator
rm ~/.config/terminator/config
ln -s ~/Documents/GitHub/dotFiles/shells/terminator/config ~/.config/terminator/

# Python setup
# sudo pip install pep8 flake8 pyflakes isort yapf jedi 

# Install TLP (battery saver)
# sudo apt-get install tlp tlp-rdw -y

# replace capslock with escape
# sudo vim /usr/share/X11/xkb/symbols/pc
# Comment out this line:
# // key <CAPS> {	[ Caps_Lock		]	};
# And add this line
# key <CAPS> {        [ Escape                ]       };

## Make Firefox use touch scrolling
## You can make this permanent by modifying the launcher using the following:
sudo sed -i "s|Exec=|Exec=env MOZ_USE_XINPUT2=1 |g" /usr/share/applications/firefox.desktop
#To undo this change, use:
# sudo sed -i "s|Exec=env MOZ_USE_XINPUT2=1 |Exec=|g" /usr/share/applications/firefox.desktop

## Docker-CE (only for bare metal)
# sudo apt-get remove docker docker-engine docker.io
# sudo apt-get update
# sudo apt-get install \\n    apt-transport-https \\n    ca-certificates \\n    curl \\n    software-properties-common\n
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository \\n   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \\n   $(lsb_release -cs) \\n   stable"
# sudo apt-get update
# sudo apt-get install docker-ce

## Multitouch gestures
# https://github.com/iberianpig/fusuma

## Pulse secure
# requires dependency
# sudo apt-get install libwebkitgtk-1.0
# download from: http://trial.pulsesecure.net/clients/ps-pulse-linux-5.3r3.0-b1021-ubuntu-debian-64-bit-installer.deb

## Intellij Idea
# snap install intellij-idea-ultimate --classic

# allows USB passthrough
sudo adduser $USER vboxusers

# Virtualbox Extension Pack
# Download
LatestVirtualBoxVersion=$(wget -qO - http://download.virtualbox.org/virtualbox/LATEST.TXT) && wget "http://download.virtualbox.org/virtualbox/${LatestVirtualBoxVersion}/Oracle_VM_VirtualBox_Extension_Pack-${LatestVirtualBoxVersion}.vbox-extpack"
# Install
sudo VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-${LatestVirtualBoxVersion}.vbox-extpack

# Install nvidia drivers
# sudo ubuntu-drivers autoinstall 

