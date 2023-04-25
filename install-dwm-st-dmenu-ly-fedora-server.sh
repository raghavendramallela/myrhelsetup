#!/bin/bash

## update the system
sudo dnf update -y

## install dependencies
sudo dnf install -y libXft-devel libXinerama-devel fontpackages-devel
sudo dnf install -y git gcc gdb
sudo dnf install -y neovim python3-neovim

## install xorg
sudo dnf install -y @base-x

## install dwm, st & dmenu
mkdir -p ~/.local/share
cd ~/.local/share
for app in dwm st dmenu; do     
  git clone "https://git.suckless.org/$app";
  cd "$app";
  make;
  sudo make clean install;
  cd ..;
  done
cd

## make dwm entry in xorg
echo "[Desktop Entry]
Encoding=UTF-8
Name=DWM
Exec=dwm-setup
Icon=dwm
Type=XSession" | sudo tee "/usr/share/xsessions/dwm.desktop"
echo "exec dwm" | sudo tee /usr/local/bin/dwm-setup

sudo chmod +x /usr/local/bin/dwm-setup

## gui at start
sudo systemctl set-default graphical.target

## clone the repo for ly-login manager
mkdir -p ~/Downloads/GitHub
cd ~/Downloads/GitHub/
git clone https://github.com/raghavendramallela/myrhelsetup.git
cd myrhelsetup/rpms
sudo dnf localinstall ly-0.0.git.73.271b4f8-1.fc35.x86_64.rpm -y

## start ly & reboot
sudo systemctl enable ly.service
sudo systemctl start ly.service
sudo reboot
