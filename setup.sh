##################################
### teal's custom setup script ###
###     for easy reinstalls    ###
##################################

################
# installation #
################

git clone https://git.sr.ht/~j-james/packages
cd packages
echo "Installing base packages..."
sudo pacman -S base

echo "Installing AUR helper..."
sudo pacman -S base-devel
git clone https://aur.archlinux.org/pakku
cd pakku
makepkg -s
makepkg -i
cd ..

echo "Installing terminal packages..."
sudo pakku -S terminal/index

echo "Installing X packages..."
sudo pakku -S x/index

echo "Installing Sway packages..."
sudo pakku -S sway/index

echo "Installing graphical packages..."
sudo pakku -S graphical/index

echo "Installation complete"

#################
# configuration #
#################

echo "Configuring..."

git clone https://git.sr.ht/~j-james/config
rm -rf ~/.config
mv config ~/.config
cd ~/.config
git checkout $USER

ln -s ~/.config/bash/bashrc ~/.bashrc
ln -s ~/.config/bash/profile ~/.profile
ln -s ~/.config/git/gitconfig ~/.gitconfig
# not sure if these are necessary
ln -s ~/.config/gtk-2.0/gtkrc-2.0 ~/.gtkrc-2.0
sudo cp ~/.config/gtk-2.0/gtkrc-2.0 /usr/share/gtk-2.0/ # or: [...]/gtk-2.0/gtkrc
sudo cp ~/.config/gtk-3.0/settings.ini /usr/share/gtk-3.0/

git clone https://github.com/doctormo/GimpPS
mkdir ~/.config/GIMP
mv GimpPS ~/.config/GIMP/2.10

sudo mkdir /usr/share/backgrounds/teal
sudo cp ~/Pictures/backgrounds/trees.jpg /usr/share/backgrounds/teal/
sudo cp ~/Pictures/face/compass.jpg /usr/share/backgrounds/teal/

sudo mkdir /etc/X11/xorg.conf.d
sudo cp ~/.config/xorg/00-keyboard.conf /etc/X11/xorg.conf.d/
sudo cp ~/.config/xorg/01-touchpad.conf /etc/X11/xorg.conf.d/

sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R

# in /etc/pacman.conf under Misc options, uncomment Color and append ILoveCandy
# launch "LightDM GTK+ Greeter settings" to customize the logon screen
# set up timeshift backups with the GUI application
# run spicetify backup and spicetify apply
# restore chromium profile
# reinstall code extensions

echo "Configuration complete"
