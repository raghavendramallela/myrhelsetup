~/Downloads/NVIDIA-Linux*.run

echo "Rebooting Back to Runlevel 5"
systemctl set-default graphical.target
reboot