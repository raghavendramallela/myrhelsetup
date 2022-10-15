echo "Updating grub2 conf"
grub2-mkconfig -o /boot/efi/EFI/redhat/grub.cfg

echo " Generating initramfs..."
mv /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r)-nouveau.img

echo "Creating new initramfs image..."
dracut /boot/initramfs-$(uname -r).img $(uname -r)

echo "Rebooting to runlevel 3..."
systemctl set-default multi-user.target
reboot