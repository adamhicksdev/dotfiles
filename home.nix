# Home-manager configuration for user 'adam'
# Reference: https://nix-community.github.io/home-manager/

{ config, pkgs, ... }:

{
  home.username = "adam";
  home.homeDirectory = "/home/adam";
  home.stateVersion = "24.11";

  # Packages
  home.packages = with pkgs; [
    neovim
    alacritty
    starship
    fzf
    ripgrep
    bat
    eza
    zoxide
  ];

  # Zsh configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "eza -la";
      cat = "bat";
      cd = "zoxide";
      grep = "rg";
    };

    initExtra = ''
      eval "$(starship init zsh)"
      eval "$(zoxide init zsh)"
    '';
  };

  # Git configuration
  programs.git = {
    enable = true;
    userName = "Adam Hicks";
    userEmail = "radamail@gmail.com";
  };

  # Starship prompt
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };

  # Kitty terminal
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrains Mono";
      font_size = 12;
      window_padding_width = 8;
    };
  };
}
