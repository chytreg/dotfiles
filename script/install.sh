#/bin/bash

echo "+ submodules"
cd ~/dotfiles; git pull origin master; git submodule update --init

echo "+ zsh"
rm -rf ~/.zshrc
ln -sf ~/dotfiles/zshrc ~/.zshrc

echo "+ ruby"
rm -rf ~/.gemrc ~/.irbrc ~/.powconfig
ln -sf ~/dotfiles/gemrc ~/.gemrc
ln -sf ~/dotfiles/irbrc ~/.irbrc
ln -sf ~/dotfiles/powconfig ~/.powconfig

echo "+ tmux"
rm -rf ~/.tmux.conf
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf

echo "+ git"
rm -rf ~/.gitconfig ~/.gitignore-global
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/gitignore-global ~/.gitignore-global
# printf "Github token: "
# read token
# sed -i -e "s/GITHUB_TOKEN/$token/g" ~/.gitconfig

# from yoursachet.com
echo "+ vim"
rm -rf ~/.vim ~/.vimrc
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/vim ~/.vim

echo "+ ssh"
rm -rf ~/.ssh
ln -sf ~/dotfiles/ssh ~/.ssh
# fix ssh-keys permission
chmod 600 ~/Dropbox/private/ssh-keys/*

echo "+ sublime settings from dropbox"
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 2/Installed\ Packages
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 2/Packages
# install package control
curl https://sublime.wbond.net/Package%20Control.sublime-package > ~/Library/Application\ Support/Sublime\ Text\ 2/Installed\ Packages/Package\ Control.sublime-package
# symlink config for dropbox
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User
ln -sf ~/Dropbox/private/Sublime/User ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/
