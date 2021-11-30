#!/bin/bash

sudo cp etc/X11/xorg.conf /etc/X11/xorg.conf

sudo cp etc/initramfs-tools/conf.d/splash /etc/initramfs-tools/conf.d/splash

# CONFIGURA EL GRUB
sudo echo "" >> /etc/default/grub
sudo echo "GRUB_GFXMODE="1280x1024x32"" >> /etc/default/grub
sudo echo "GRUB_GFXPAYLOAD_LINUX="1280x1024x32"" >> /etc/default/grub
sudo update-grub

# CREA UN SCRIPT que se ejecuta junto con X11 para ajustar la Pantalla
mkdir ~/script
echo "#!/bin/bash" > ~/script/Resolucion.sh
echo "xrandr -s 1440x900" >> ~/script/Resolucion.sh
sudo echo "bash $HOME/script/Resolucion.sh" >> /etc/X11/xinit/xinitrc

sudo update-initramfs -u

sudo systemctl restart display-manager

xrandr -s 1440x900
