#!/usr/bin/env sh

set -e

sudo add-apt-repository ppa:webupd8team/nemo
sudo apt-get update
sudo apt-get install nemo nemo-fileroller nemo-dropbox
xdg-mime query default inode/directory

# as per: https://sites.google.com/site/installationubuntu/tweaking-ubuntu/change-default-filemanager
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop show-desktop-icons true


