# install zsh 
sudo apt-get update
sudo apt-get install zsh -y

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm ~/.zshrc
ln -s ~/Repositories/GitHub/raydennis/dotfiles/shells/zsh/.zshrc ~/.zshrc

rm -rf ~/.zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

rm -rf ~/.zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

rm ~/z.sh
ln -s ~/Repositories/GitHub/raydennis/dotfiles/shells/zsh/z/z.sh ~/z.sh
ln -s ~/re

rm ~/.vim/coc-settings.json
ln -s ~/Repositories/GitHub/raydennis/dotfiles/editors/vim/coc-settings.json ~/.vim/coc-settings.json

rm -rf ~/.vim/UltiSnips
ln -s ~/Repositories/GitHub/raydennis/dotfiles/editors/vim/ultisnips ~/.vim/UltiSnips

rm ~/.gitconfig
ln -s ~/Repositories/GitHub/raydennis/dotfiles/.gitconfig ~/.gitconfig

rm ~/.gitignore_global
ln -s ~/Repositories/GitHub/raydennis/dotfiles/.gitignore_global ~/.gitignore_global

rm ~/.vim/spell/en.utf-8.add
ln -s ~/Repositories/GitHub/raydennis/dotfiles/editors/vim/en.utf-8.add ~/.vim/spell/en.utf-8.add

# ranger
sudo apt install ranger
rm -rf ~/.config/ranger
ln -s ~/Repositories/GitHub/raydennis/dotfiles/shells/ranger ~/.config/ranger
rit clone https://Github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

