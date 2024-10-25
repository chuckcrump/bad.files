# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./apple-silicon-support
      #inputs.home-manager.nixosModules.default
      ./stylix.nix
      ./gpu-asahi.nix
      ./garbage.nix
    ];
  

 # nixpkgs.overlays = [
 #       inputs.apple-silicon.overlays.apple-silicon-overlay
 # ];

  hardware.asahi.peripheralFirmwareDirectory = ./firmware;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  boot.extraModprobeConfig = ''
    options hid_apple iso_layout=0
  '';

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

   networking.hostName = "nixbookpro32"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetwowkConfiguration = true;
  };

  # Set your time zone.
   time.timeZone = "America/Los_Angles";
   #time.hardwareClockInLocalTime = true;
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
   services.xserver.enable = true;
   services.xserver.displayManager.gdm.enable = true;
   services.xserver.desktopManager.gnome.enable = true;

  

  # Configure keymap in X11
   services.xserver.xkb.layout = "us";
   services.xserver.xkbVariant = "colemak";
   services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
   services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  # Enable touchpad support (enabled default in most desktopManager).
   services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.<username> = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       firefox-beta
       tiny-dfr
       neovim
       kitty
       fish
       starship
       zoxide
       floorp
       ninja
       meson
       git
       vscode
       kanata
       swww
       libsass
       pamixer
       gtk-layer-shell
       gtk3
       yazi
       polkit_gnome
       base16-schemes
       libreoffice
     ];
   };

  home-manager = {
    users = {
    "andy" = import ./home.nix;
    };
  };

  fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "Recursive" ]; })
  quicksand
  inter
  ];

  #systemstuff
  systemd.services.kanata = {
    description = "Kanata Key Remapper";
    after = [ "network.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.kanata}/bin/kanata --cfg /home/andy/.config/kanata/config.kbd";
      Restart = "no";
    };

    wantedBy = [ "multi-user.target" ];
  };

  zramSwap.enable = true;

  #Hyprland
  programs.hyprland ={
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     pkgs.gnome-settings-daemon
     pkgs.gnome-tweaks
   ];

      systemd.services.tiny-dfr = {
      description = "Tiny Apple silicon touch bar daemon";
    serviceConfig = {
        ExecStart = "${pkgs.tiny-dfr}/bin/tiny-dfr";
        Restart = "no";
    };

      after = [
        "getty@tty1.service"
      ];
      before = [
        "gdm.service"
      ];
    };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

