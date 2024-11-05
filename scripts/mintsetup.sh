# Nix Multi-user setup
sh <(curl -L https://nixos.org/nix/install) --daemon

# Packages
nix-env -iA nixpkgs.steam nixpkgs.signal-desktop nixpkgs.kdePackages.kdenlive nixpkgs.flameshot nixpkgs.gimp nixos.backintime
