cd ~/Downloads/

echo "Downloading NVIDIA run script..."
wget https://download.nvidia.com/XFree86/Linux-x86_64/515.76/NVIDIA-Linux-x86_64-515.76.run

echo "changing nvidia run permissions..."
chmod +x ~/Downloads/NVIDIA-Linux*.run
sudo -i

echo "updating rhel..."
dnf update

echo "rebooting..."
reboot
