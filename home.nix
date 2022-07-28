{ config, pkgs, lib, ... }:

let
  desktopPkgs = with pkgs; [
    discord
    spotify
    lxrandr
    i3lock-fancy
    flameshot
    syncthing
    nitrogen
    thunderbird
    jupyter
    vlc
  ];

  shellPkgs = with pkgs; [
    # nvim
    xclip
    ripgrep
    fd
    nixfmt

    # Shell
    any-nix-shell
    nodejs-16_x
    gcc
    curl
    wget
    delta

    # Utility
    htop
    cheat
    neofetch
    lsd
    bat
    netcat
    feh
    pulsemixer
    ranger
    rnix-lsp
    clang-tools

    # Man
    clang-manpages
    man-pages
    posix_man_pages

    # Python
    python39Packages.poetry
    (python39.withPackages (ps: with ps; [ pip pandas ]))
  ];

  npmPkgs = with pkgs.nodePackages; [
    typescript-language-server
    typescript
    js-beautify
    node2nix
  ];

in {
  programs.home-manager.enable = true;

  nixpkgs.config = { allowUnfree = true; };

  home = {
    username = "floride";
    homeDirectory = "/home/floride";

    packages = desktopPkgs ++ shellPkgs ++ npmPkgs;
    stateVersion = "21.11";
  };

  home.keyboard = { layout = "gb"; };

  imports = [
    ./programs/alacritty/default.nix
    ./programs/nvim/default.nix
    ./programs/zsh/default.nix
    ./programs/git/default.nix
    ./programs/rofi/default.nix

    ./services/syncthing/default.nix
    ./services/polybar/default.nix
  ];

  systemd.user.services.mpris-proxy = {
    Unit.Description = "Mpris proxy";
    Unit.After = [ "network.target" "sound.target" ];
    Service.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    Install.WantedBy = [ "default.target" ];
  };

  xsession.windowManager.i3 =
    import ./services/i3/default.nix { inherit pkgs lib; };
}
