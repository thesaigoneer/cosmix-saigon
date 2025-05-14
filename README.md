## Cosmix-Saigon

In my series of composables I introduce Cosmix Saigon, NixOS with the Cosmic DE on top. 

### Nothing of this would be even remotely possible without the fantastic NixBook project by Mike Kelly, which you can find at https://github.com/mkellyxp/nixbook

![nixbook os logo](https://github.com/user-attachments/assets/8511e040-ebf0-4090-b920-c051b23fcc9c)


It's goal is to create a "chromebook like" unbreakable computer to give to basic users who know nothing about Linux and won't need to ever worry about updates / upgrades.

Cosmix Saigon is more aimed at the intermediate to experienced user, using the Cosmic desktop environment, changing channels and using the latest kernel.


### Step 1:  
        
        Install NixOS, and choose the No Desktop option.

### Step 2:  

        Enable unfree software

### Step 3:  

        Format your drive however you like (erase disk, swap, no hibernate)

### Step 4:  

        Reboot, login, and connect to wifi, then hit ESC

```
nmtui
```
### Step 5:

To get the latest version of Cosmic and the kernel we have to switch channel:

    nix-channel --add https://channels.nixos.org/nixos-unstable nixos

You can then upgrade NixOS to the latest version in your chosen channel by running:

    nixos-rebuild switch --upgrade

Reboot & login again

### Step 6:  Go to /etc and nix-shell git
```
cd /etc/
nix-shell -p git
```


### Step 7:  Clone the nixbook repo  (make sure you run as sudo and you're in /etc!)
```
sudo git clone https://github.com/thesaigoneer/cosmix-saigon
```

### Step 8:  Run the install script (run this with NO sudo)
```
cd cosmix-saigon
./install.sh
```

### Step 9:  Enjoy Cosmix Saigon!

You can always manually run updates by running **Update and Reboot** in the menu.

If you want to completely reset this nixbook, wipe off your personal data to give it to someone else, or start fresh, run **Powerwash** from the menu.

---

Notes:
- The Nix channel will be updated from this git config once tested, and will auto apply to your machine within a week
- Simply reboot for OS updates to apply.
- Don't modify the .nix files in this repo, as they'll get overwritten on update.  If you want to customize, put your nix changes directly into /etc/nixos/configuration.nix


---

If at any point you're having issues with your nixbook not updating, check the auto-update-config service by running 

```
sudo systemctl status auto-update-config
```

If it shows any errors, go directly to /etc/nixbook and run

```
sudo git pull --rebase
```

Then you can start the autoupdate service again by running

```
sudo systemctl status auto-update-config
```
