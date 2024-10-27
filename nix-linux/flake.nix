{
  description = "A Nix flake with nixpkgs unstable for latest packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    pkgs = import nixpkgs { system = "aarch64-linux"; };
  in {
    # Define packages for aarch64-linux
    packages = {
      aarch64-linux = {
        # Define "my-packages" specifically within aarch64-linux
        my-packages = pkgs.buildEnv {
          name = "my-packages";
          paths = with pkgs; [
            fzf
            zoxide
            zellij
            tmux
            git
            wofi
            starship
            zsh
            neofetch
            fastfetch
          ];
        };
      };
    };
    
    # Optionally, define devShells if you want to use a development shell
    devShells = {
      default = pkgs.mkShell {
        buildInputs = with pkgs; [
          fzf
          zoxide
        ];
      };
    };
  };
}

