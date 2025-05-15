## Cosmix-Saigon

#### Nothing of this would be even remotely possible for me without the fantastic NixBook project by Mike Kelly, which you can find at https://github.com/mkellyxp/nixbook

![nixbook os logo](https://github.com/user-attachments/assets/8511e040-ebf0-4090-b920-c051b23fcc9c)


It's goal is to create a "chromebook like" unbreakable computer to give to basic users who know nothing about Linux and won't need to ever worry about updates / upgrades.

Cosmix Saigon is more aimed at the intermediate to experienced user, using the Cosmic desktop environment, changing channels and using the latest kernel.

There are some fundamental changes compared to the NixBook project:

        * The main DE is not Cinnamon, but the Cosmic desktop
        * Cosmix uses the nixos-unstable channel and the latest kernel, to provide the latest and greatest
        * Chrome, Libreoffice and Zoom are not installed ootb; Firefox is also removed from the base install
        * Cosmic-tweaks, eza, fastfetch, htop, mc, micro and vim are added, as well as the Flatseal flatpak
        * All other applications can be installed through the Cosmic store or the terminal


#### Cosmix-Saigon basically takes the automation part of the NixBook project and is still 'set-and-forget'; flatpaks will be updated daily and NixOS will be updated once a week.


### Step 1:  
        
        Install NixOS, and choose the No Desktop option.

### Step 2:  

        Enable unfree software

### Step 3:  

        Format your drive however you like (erase disk, swap, no hibernate)

### Step 4:  

        Reboot, login, and connect to the network

### Step 5

To get the latest version of Cosmic and the kernel we have to switch channel, as root:

    nix-channel --add https://channels.nixos.org/nixos-unstable nixos

You can then upgrade NixOS to the latest version in your chosen channel by running as root:

    nixos-rebuild switch --upgrade

Reboot & login again

### Step 6:  Go to /etc and nix-shell git
```
cd /etc/
nix-shell -p git
```

### Step 7:  Clone the Cosmix repo  (make sure you run as sudo and you're in /etc!)
```
sudo git clone https://github.com/thesaigoneer/cosmix-saigon
```

### Step 8:  Run the install script (run this with NO sudo)
```
cd cosmix-saigon
./install.sh
```

### Enjoy Cosmix Saigon!

## Notes:

You can always manually run updates by running **updates** manually:

        cd /etc/cosmix-saigon
        
        ./update.sh  **or** ./update_shutdown.sh

If you want to completely reset this nixbook, wipe off your personal data to give it to someone else, or start fresh, run **powerwash**:

        cd /etc/cosmix-saigon

        ./powerwash.sh


- The Nix channel will be updated from this git config once tested, and will auto apply to your machine within a week, on Monday
- Simply reboot for OS updates to apply.
- Don't modify the .nix files in this repo, as they'll get overwritten on update.  If you want to customize, put your nix changes directly into /etc/nixos/configuration.nix

If at any point you're having issues with your nixbook not updating, check the auto-update-config service by running: 

        sudo systemctl status auto-update-config
        
If it shows any errors, go directly to /etc/nixbook and run

        sudo git pull --rebase

Then you can start the autoupdate service again by running

        sudo systemctl status auto-update-config

--------------
### Yada yada

Feel free to use these builds and dots. I do not, however, offer or imply any form of support or ongoing maintenance. 

And of course, you use them entirely at your own risk. Have fun!


15-05-2025
