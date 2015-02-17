#!/usr/bin/env sh

set -e
# Any subsequent(*) commands which fail will cause the shell script to exit immediately

sudo apt-get install python-dev libfreetype6-dev libpng12-dev libhdf5-dev libhdf5-serial-dev libblas-dev liblapack-dev gfortran python-tk tk-dev
sudo apt-get install python-pip
sudo pip install virtualenv
virtualenv ~/ska
source ~/ska/bin/activate
pip install --upgrade numpy
pip install --upgrade matplotlib
pip install --upgrade iniparse construct spead cython h5py
pip install --upgrade scipy
pip install --upgrade ipython
