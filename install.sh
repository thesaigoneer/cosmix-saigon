echo "This will delete ALL local files and convert this machine to a Nixbook!";
read -p "Do you want to continue? (y/n): " answer

if [[ "$answer" =~ ^[Yy]$ ]]; then
  echo "Installing Cosmix-Saigon..."

  # Set up local files
  rm -rf ~/
  mkdir ~/Desktop
  mkdir ~/Documents
  mkdir ~/Downloads
  mkdir ~/Pictures
  mkdir ~/.local
  mkdir ~/.local/share
  cp -R /etc/cosmix-saigon/config/config ~/.config
  cp /etc/cosmix-saigon/config/desktop/* ~/Desktop/
  cp -R /etc/cosmix-saigon/config/applications ~/.local/share/applications

  # The rest of the install should be hands off
  # Add Nixbook config and rebuild
  sudo sed -i '/hardware-configuration\.nix/a\      /etc/cosmix-saigon/base.nix' /etc/nixos/configuration.nix
  
  # Set up flathub repo while we have sudo
  nix-shell -p flatpak --run 'sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo'

  sudo nixos-rebuild switch

  # Add flathub and some apps
  flatpak install flathub com.vivaldi.Vivaldi -y
  flatpak install flathub org.libreoffice.LibreOffice -y
  

  reboot
else
  echo "Cosmix-Saigon Install Cancelled!"
fi
