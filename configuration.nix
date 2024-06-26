{ pkgs, lib, ... }:

{
  nix = {
    settings = {
      substituters = [ "https://cache.nixos.org/" ];
      trusted-public-keys =
        [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
      trusted-users = [ "@admin" ];
    };
    configureBuildUsers = true;
    package = pkgs.nixFlakes;
    extraOptions = ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
    '' + lib.optionalString (pkgs.system == "aarch64-darwin") ''
      extra-platforms = x86_64-darwin aarch64-darwin
    '';
  };

  users.users.masihkasar = {
    name = "masihkasar";
    home = "/Users/masihkasar";
  };

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Apps
  # `home-manager` currently has issues adding them to `~/Applications`
  # Issue: https://github.com/nix-community/home-manager/issues/1341
  environment.systemPackages = with pkgs; [

    # Shell
    zsh
    zsh-autosuggestions
    zsh-nix-shell
    zsh-syntax-highlighting
    zsh-autocomplete

    vim
    discord
    # terminal-notifier
    # home-manager
    # oh-my-zsh
    # screenfetch
    # openvpn
    spotify
    postman
    rectangle

  ];

  programs = { nix-index = { enable = true; }; };

  # Fonts
  fonts = { fontDir = { enable = true; }; };

  fonts.fonts = with pkgs; [
    recursive
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Keyboard
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;
}
