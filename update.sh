echo "This will update your Nixbook and reboot";
read -p "Do you want to continue? (y/n): " answer

if [[ "$answer" =~ ^[Yy]$ ]]; then
  echo "Updating Cosmix-Saigon..."

  sudo systemctl start auto-update-config.service;

  # Free up space before updates
  nix-collect-garbage --delete-older-than 15d

  # get the updates
  sudo nixos-rebuild boot --upgrade

  # free up a little more space with hard links
  nix-store --optimise

  reboot
else
  echo "Update Cancelled!"
fi
