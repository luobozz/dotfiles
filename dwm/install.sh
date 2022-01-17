#!/bin/bash
[ -d "~/soft/dwm" ] || rm -rf ~/soft/dwm
mkdir -p ~/soft/dwm
cp -rf ./dwm/* ~/soft/dwm
cd ~/soft/dwm
# ls
pwd
sudo make install