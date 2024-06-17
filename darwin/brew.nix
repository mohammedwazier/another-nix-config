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
    onActivation.cleanup = "zap";
    onActivation.upgrade = true;
    global.brewfile = true;

    brews = [ "openssl" "openssl@1.1" "qemu" "llvm" ];

    casks = [
      # Utils
      "rectangle"
      "vlc"
      "dbeaver-community"
      "brave-browser"
      "postman"
      "visual-studio-code"
      "openvpn-connect"
      "coconutbattery"
      "macs-fan-control"

      "betterdisplay"
      "ccleaner"
      "anydesk"

      "parsec"

      "spotify"
      "slack"
      "discord"
      # "libreoffice"

      # "hot"

      # Dev
      "alacritty"
      "zed"
      "insomnia"
      "karabiner-elements"
      "warp"
      "turbo-boost-switcher"
    ];

    # taps = [ "homebrew/cask" "homebrew/cask-versions" "homebrew/cask-drivers" ];
  };
}
