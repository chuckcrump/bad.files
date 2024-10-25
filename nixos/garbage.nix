{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.flatpak.enable = true;

  environment.sessionVariables = {
    AQ_DRM_DEVICES = "/dev/dri/card0";
  };

  environment.sessionVariables = {
    WLR_DRM_DEVICES = "/dev/dri/card0";
  };
}
