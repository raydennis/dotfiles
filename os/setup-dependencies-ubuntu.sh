# install vim-gtk3
apt install vim-gtk3, curl, zsh, silversearcher-ag, wget, zsh, ctags, npm fzf -y

# Install nerdfont
mkdir -p ~/.fonts
cd ~/.local/share/fonts && curl -fLo "Fura Mono Regular Nerd Font Complete Mono.otf" https://Github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.otf

# setup zsh autosuggestisons
rm -rf ~/.zsh/plugins/zsh-autosuggestions
mkdir ~/.zsh/plugins/zsh-autosuggestions
ln -s ~/Github/dotfiles/shells/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# setup zsh-syntax-highlighting
rm -rf ~/.zsh/plugins/zsh-syntax-highlighting
mkdir ~/.zsh/plugins/zsh-syntax-highlighting
ln -s ~/Github/dotfiles/shells/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

rm ~/z.sh
ln -s ~/Github/dotfiles/shells/zsh/z/z.sh ~/z.sh

rm ~/.vimrc
ln -s ~/Github/dotfiles/editors/vim/.vimrc ~/.vimrc

rm ~/.zshrc
ln -s ~/Github/dotfiles/shells/zsh/.zshrc ~/.zshrc

mkdir ~/.vim/colors
rm ~/.vim/colors/monokai.vim
ln -s ~/Github/dotfiles/editors/vim/vim-monokai/colors/monokai.vim ~/.vim/colors/monokai.vim

rm ~/.vim/colors/solarized.vim
ln -s ~/Github/dotfiles/editors/vim/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim

rm ~/.vim/colors/nord.vim
ln -s ~/Github/dotfiles/editors/vim/nord/nord-vim/colors/nord.vim ~/.vim/colors/nord.vim

rm -rf ~/.vim/UltiSnips
ln -s ~/Github/dotfiles/editors/vim/ultisnips ~/.vim/UltiSnips

ln -s ~/Github/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/Github/dotfiles/.gitignore_global ~/.gitignore_global

rm ~/.vim/coc-settings.json

ln -s ~/Github/dotfiles/editors/vim/coc-settings.json ~/.vim/coc-settings.json

rm ~/.vim/spell/en.utf-8.add
ln -s /mnt/c/Users/Ray/Github/dotfiles/editors/vim/en.utf-8.add ~/.vim/spell/en.utf-8.add

# ranger
sudo apt install ranger
rm -rf ~/.config/ranger
ln -s ~/Github/dotfiles/shells/ranger ~/.config/ranger
git clone https://Github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

# # Terminator setup
apt-get install terminator
mkdir ~/.config/terminator
rm ~/.config/terminator/config
ln -s ~/Github/dotfiles/shells/terminator/config ~/.config/terminator/


# Python setup
pip install pep8 flake8 pyflakes isort yapf jedi 

# Install TLP (battery saver)
# apt-get install tlp tlp-rdw -y

# replace capslock with escape
# vim /usr/share/X11/xkb/symbols/pc
# Comment out this line:
# // key <CAPS> {	[ Caps_Lock		]	};
# And add this line
# key <CAPS> {        [ Escape                ]       };

## Make Firefox use touch scrolling
## You can make this permanent by modifying the launcher using the following: sed -i "s|Exec=|Exec=env MOZ_USE_XINPUT2=1 |g" /usr/share/applications/firefox.desktop
#To undo this change, use:
# sed -i "s|Exec=env MOZ_USE_XINPUT2=1 |Exec=|g" /usr/share/applications/firefox.desktop

## Docker-CE (only for bare metal)
# apt-get remove docker docker-engine docker.io
# apt-get update
# apt-get install \\n    apt-transport-https \\n    ca-certificates \\n    curl \\n    software-properties-common\n
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# add-apt-repository \\n   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \\n   $(lsb_release -cs) \\n   stable"
# apt-get update
# apt-get install docker-ce

## Multitouch gestures # https://Github.com/iberianpig/fusuma

## Pulse secure
# requires dependency
# apt-get install libwebkitgtk-1.0
# download from: http://trial.pulsesecure.net/clients/ps-pulse-linux-5.3r3.0-b1021-ubuntu-debian-64-bit-installer.deb

## Intellij Idea
# snap install intellij-idea-ultimate --classic

# allows USB passthrough
# adduser $USER vboxusers

# # Virtualbox Extension Pack
# # Download
LatestVirtualBoxVersion=$(wget -qO - http://download.virtualbox.org/virtualbox/LATEST.TXT) && wget "http://download.virtualbox.org/virtualbox/${LatestVirtualBoxVersion}/Oracle_VM_VirtualBox_Extension_Pack-${LatestVirtualBoxVersion}.vbox-extpack"
# Install
VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-${LatestVirtualBoxVersion}.vbox-extpack

# Install nvidia drivers
# ubuntu-drivers autoinstall 

# ranger
sudo apt install ranger
rm -rf ~/.config/ranger
ln -s ~/Github/dotfiles/shells/ranger ~/.config/ranger
git clone https://Github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

