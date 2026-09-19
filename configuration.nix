# Edit this configuration to match your hardware and preferences.
# Reference: https://search.nixos.org/options

{ config, pkgs, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "hostname"; # Replace with your hostname
  networking.networkmanager.enable = true;

  # Time zone
  time.timeZone = "America/Detroit";

  # Internationalisation
  i18n.defaultLocale = "en_US.UTF-8";

  # User account
  users.users.adam = {
    isNormalUser = true;
    description = "Adam Hicks";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System packages
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
    firefox
    kitty
    zsh
  ];

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable OpenGL
  hardware.opengl.enable = true;

  # This value determines the NixOS release
  system.stateVersion = "24.11";
}
