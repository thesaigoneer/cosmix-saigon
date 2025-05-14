echo "This will delete ALL local files and reset this Nixbook!";
read -p "Do you want to continue? (y/n): " answer

if [[ "$answer" =~ ^[Yy]$ ]]; then
echo "Powerwashing NixBook..."

  sudo systemctl start auto-update-config.service;
  
  # Erase data and set up home directory again
  rm -rf ~/
  mkdir ~/Desktop
  mkdir ~/Documents
  mkdir ~/Downloads
  mkdir ~/Pictures
  mkdir ~/.local
  mkdir ~/.local/share
  cp -R /etc/cosmix-saigon/config/config ~/.config
  cp /etc/cosmix-saigon/desktop/* ~/Desktop/
  cp -R /etc/cosmix-saigon/config/applications ~/.local/share/applications

  sudo rm -r /var/lib/flatpak

  # Clear space and rebuild
  sudo nix-collect-garbage -d
  sudo nixos-rebuild switch --upgrade
  sudo nixos-rebuild list-generations

  # Add flathub and some apps
  sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  flatpak install flathub com.vivaldi.Vivaldi -y
  flatpak install flathub org.libreoffice.LibreOffice -y
  
 
  reboot
else
  echo "Powerwashing Cancelled!"
fi
