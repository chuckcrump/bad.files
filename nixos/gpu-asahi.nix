{config, pkgs, inputs, ...}:
{
  hardware.asahi = {
    enable = true;
    useExperimentalGPUDriver = true;
    experimentalGPUInstallMode = "replace";
    setupAsahiSound = true;
    withRust = true;
  };
}
