echo "Appending ‘blacklist nouveau’ in /etc/modprobe.d/blacklist.conf ..."

echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf

echo "open this script (in vi or nano editor) to do additional stuff ..."


### Additional stuff:
# Edit /etc/default/grub
# Append ‘rd.driver.blacklist=nouveau’ to end of ‘GRUB_CMDLINE_LINUX=”…”‘. 

# Example:
# GRUB_CMDLINE_LINUX="crashkernel=auto resume=/dev/mapper/rl_rocky--linux-swap rd.lvm.lv=rl_rocky-linux/root rd.lvm.lv=rl_rocky-linux/swap rhgb quiet rd.driver.blacklist=nouveau"


