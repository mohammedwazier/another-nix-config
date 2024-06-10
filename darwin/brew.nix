{ config, /*lib, pkgs,*/ ... }:

# Using Brew until nix-darwin is patched and working with
# /Application folder

# with lib;

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

    brews = [ "openssl" "openssl@1.1" "qemu" "rust" "stockfish" ];

    # brewPrefix = mkOption {
    #   type = types.str;
    #   default = if pkgs.stdenv.hostPlatform.darwinArch == "aarch64" then "/opt/homebrew/bin" else "/usr/local/bin";
    #   example = "/usr/local/bin";
    #   description = ''
    #     The directory where Homebrew is installed.
    #   '';
    # };

    casks = [
      # Utils
      # "1password"
      "raycast"
      "rectangle"
      # "alt-tab"
      "vlc"
      "dbeaver-community"

      # Office
      # "dropbox"
      "spotify"
      # "microsoft-office"
      # "obsidian"
      # "mullvadvpn"
      "slack"

      # Dev
      # "alacritty"
      "zed"
      # "podman-desktop"
      # "datagrip"
      # "pycharm"
      "insomnia"
      # "karabiner-elements"
      # "balenaetcher"
    ];

    taps = [ "homebrew/cask" "homebrew/cask-versions" "homebrew/cask-drivers" ];
  };
}
