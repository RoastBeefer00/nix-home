# nix-home
## Installation
In theory these installation steps should work on any distro (except nixOS), however I have only tested this on Debian 12.  
If attempting on another distro, you will need to adjust some of the commands for your package manager.
This guide also assumes you are using SDDM, which is the default when using Plasma.

First run some updates and install some programs you'll need:
```bash
sudo apt update
sudo apt upgrade
sudo apt install curl vim
```

[Install the Nix package manager](https://nixos.org/download/):
```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

[Install Home Manager](https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone):
```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

nix-channel --update
nix-shell '<home-manager>' -A install
```

Enable experimental features for Nix:
```bash
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

Install [nixGL](https://github.com/nix-community/nixGL), which is the program that [enables Hyprland](https://wiki.hyprland.org/Nix/Hyprland-on-other-distros/) to run:
```bash
nix-channel --add https://github.com/nix-community/nixGL/archive/main.tar.gz nixgl && nix-channel --update
nix-env -iA nixgl.auto.nixGLDefault
```

Clone down this repo:
```bash
git clone https://github.com/RoastBeefer00/nix-home.git
cd nix-home
```

Use vim (or whatever text editor you prefer) to edit `home.nix` and change the first few lines from `roastbeefer` to your own user:
> NOTE: Use command `whoami` if you don't know your username
> NOTE: There are probably many refences to the `roastbeefer` user in this file and potentially others like `.zshrc`... sorry you're gonna have to find and replace these
```
  home.username = "roastbeefer";
  home.homeDirectory = "/home/roastbeefer";
```

Copy these files to your home config:
```bash
mkdir -p ~/.config/home-manager
cp -r * ~/.config/home-manager
cp .zshrc ~/.config/home-manager
cp waves.jpg ~/Pictures
```

Install the home manager config:
```bash
home-manager switch
```

At this point Hyprland and all applictions in the home manager config should be installed.
Now the only thing left is to create an SDDM entry for Hyprland.  Use `sudo vim /usr/share/wayland-sessions/hyprland.desktop` to enter:
```
[Desktop Entry]
Exec=nixGL Hyprland
Name=Hyprland
```

Log out and select Hyprland in SDDM.  Enjoy!
