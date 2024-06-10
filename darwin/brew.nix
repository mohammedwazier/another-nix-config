{ config, lib, pkgs, ... }:

# Using Brew until nix-darwin is patched and working with
# /Application folder

with lib;

let user_name = "masihkasar";
in {
  environment.shellInit = ''
    eval "$(${config.homebrew.brewPrefix}/brew shellenv)"
  '';

  homebrew = {
    enable = true;
    # enableRosetta = true;
    onActivation.cleanup = "zap";
    onActivation.upgrade = true;
    global.brewfile = true;

    brews = [ "openssl" "openssl@1.1" "qemu" ];

    casks = [
      # Utils
      # "1password"
      # "raycast"
      "rectangle"
      # "alt-tab"
      "vlc"
      # "dbeaver-community"
      # "dbeaverlite"
      "brave-browser"
      "postman"
      "visual-studio-code"
      "openvpn-connect"

      # Office
      # "dropbox"
      "spotify"
      # "microsoft-office"
      # "obsidian"
      # "mullvadvpn"
      "slack"
      "discord"

      # Dev
      # "alacritty"
      "zed"
      # "podman-desktop"
      # "datagrip"
      # "pycharm"
      "insomnia"
      # "karabiner-elements"
      # "balenaetcher"
      "warp"
    ];

    # taps = [ "homebrew/cask" "homebrew/cask-versions" "homebrew/cask-drivers" ];
  };
}
