# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew
brew install ripgrep git git-credential-manager nmap openconnect openssl python sshfs the_silver_searcher tree z aspell osxfuse imgcat
sudo dnf -y install curl zsh the_silver_searcher wget ctags npm xclip 


# neovim
brew install neovim
mkdir -p ~/.config/nvim
rm ~/.config/nvim/init.lua
ln -s ~/Repositories/GitHub/raydennis/dotfiles/editors/neovim/init.lua ~/.config/nvim/init.lua
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/Repositories/GitHub/raydennis/dotfiles/editors/neovim/snippets ~/.config/nvim/snippets

# zsh
brew install zsh zsh-syntax-highlighting zsh-autosuggestions
rm ~/.zshrc
ln -s ~/Repositories/GitHub/raydennis/dotfiles/shells/zsh/.zshrc ~/.zshrc


# font
brew tap homebrew/cask-fonts
brew cask install font-firacode-nerd-font

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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
brew install z
rm ~/z.sh
ln -s ~/Repositories/GitHub/raydennis/dotfiles/shells/zsh/z/z.sh ~/z.sh

# git
rm ~/Repositories/GitHub/raydennis/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/Repositories/GitHub/raydennis/dotfiles/.gitconfig ~/.gitconfig
rm ~/Repositories/GitHub/raydennis/dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/Repositories/GitHub/raydennis/dotfiles/.gitignore_global ~/.gitignore_global

# spelling
rm ~/.vim/spell/en.utf-8.add
mkdir -p ~/.vim/spell/
ln -s ~/Repositories/GitHub/raydennis/dotfiles/editors/vim/en.utf-8.add ~/.vim/spell/en.utf-8.add

# ranger
brew tap eddieantonio/eddieantonio
brew install w3m elinks poppler transmission mediainfo exiftool ranger
rm -rf ~/.config/ranger
ln -s ~/Repositories/Github/raydennis/dotfiles/shells/ranger ~/.config/ranger
git clone https://Repositories/Github/raydennis.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

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
