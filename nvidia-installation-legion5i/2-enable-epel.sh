echo "Enabling EPEL repository..."

dnf install \
https://dl.fedoraproject.org/pub/epel/9/Everything/x86_64/Packages/e/epel-next-release-9-4.el9.noarch.rpm \
https://dl.fedoraproject.org/pub/epel/9/Everything/x86_64/Packages/e/epel-release-9-4.el9.noarch.rpm


echo "Installing needed packages... "
dnf install kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig

