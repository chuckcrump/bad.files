#/bin/sh
nix profile remove "my-packages"
nix profile install "/home/$USER/nix#my-packages"
