# Cosmix Saigon

### The core of Cosmic DE on top of UniversalBlue

With the upcoming release of alpha 7 of Cosmic DE and the addition to the Fedora and UniversalBlue releases it was time to roll my own container image again.

The Universal Blue project (https://universal-blue.org/) provides a number of excellent images to start off with. They include codecs, printing support, homebrew for all your cli wishes, distrobox etc. out of the box. 

I always use the latest branch, so updates will arrive automagically. Htop and vim are already included in this base image. For all cli tooling I now refer to Homebrew, for which the prequisites are added to the image by me. 

Secondly, I have removed the Cosmic store, editor and media player. They (or better alternatives) can be installed as flatpak's, i.e. Zed and Cosmic tweaks.

-        Added for Homebrew:
         procps-ng curl file git
         group development-tools
                                                                   
         Removed:
         firefox
         nvtop
         cosmic-edit
         cosmic-player
         cosmic-store

### Rebase

First install the base iso of Fedora Sway Atomic or another Fedora atomic, like Silverblue , and then:

         rpm-ostree rebase ostree-unverified-registry:ghcr.io/thesaigoneer/cosmix-saigon:latest
         systemctl reboot

Log in again and switch to the signed image:

         rpm-ostree rebase ostree-image-signed:docker://ghcr.io/thesaigoneer/cosmix-saigon:latest
         systemctl reboot
    
Welcome to Cosmix-Saigon!

### First things first:

Now you have an Ublue base image install, based on Fedora, so there's no Flathub enabled ootb. Let's rectify that first:

         flatpak remote-add flathub https://dl.flathub.org/repo/flathub.flatpakrepo 
    
Then install a browser (Brave, Firefox, Librewolf, Vivaldi, Zen) to get your basic functionality up and running: 

         flatpak install "your favorite browser"

Flathub (https://flathub.org/) is our 'software store', where you look for, find and install additional applications from.

### Homebrew 

I include all prerequisites for Homebrew in the image right now. So there are no more cli tools included, you can brew them.

First install Homebrew by running this script:

        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Closely follow the next steps in the terminal, as stated on-screen after install. The mentioned 'development-tools' are already included in Obelix.

More information about Homebrew can be found at https://brew.sh/

Enjoy your freshly installed Cosmix-Saigon!

--------------
### Yada yada

Feel free to use these builds and dots. I do not, however, offer or imply any form of support or ongoing maintenance. And of course, you use them entirely at your own risk. Have fun!


27-04-2025


