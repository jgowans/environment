#!/usr/bin/env sh

# ZSH
sudo apt-get install yodl yodl-doc libncurses5-dev autoconf
git clone git://git.code.sf.net/p/zsh/code $HOME/workspace/zsh
cd $HOME/workspace/zsh
./Util/preconfig
./configure
make
sudo make install
echo $(which zsh) | sudo tee --append /etc/shells


