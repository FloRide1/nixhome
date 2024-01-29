{ config, pkgs, lib, ... }:

let
  desktopPkgs = with pkgs; [
    # Wayland
    mako
    wl-clipboard
    shotman

    spotify
    lxrandr
    i3lock-fancy
    flameshot
    syncthing
    nitrogen
    thunderbird
    jupyter
    vlc
    discord
    dotnet-sdk_7
    arandr
    autorandr
    networkmanagerapplet
    kicad-small
    libreoffice
    inkscape
    zathura
    evince
    freecad
    cups
    prettierd
    wdisplays
  ];

  shellPkgs = with pkgs; [
    # Rust 
    cargo-watch
    # clippy
    rustup

    # nvim
    xclip
    ripgrep
    fd
    nixfmt
    gnumake
    ### lldb
    texlive.combined.scheme-medium
    tree-sitter-grammars.tree-sitter-rust
    cargo-nextest
    nodePackages.volar

    # Shell
    any-nix-shell
    nodejs
    gcc
    grc
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
    zip
    unzip
    docker-compose

    # Man
    clang-manpages
    man-pages
    man-pages-posix

    # Others
    ansible
    jdk
    maven

    # Python
    # python39Packages.poetry
    # (python39.withPackages (ps: with ps; [ pip pandas ]))
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
    stateVersion = "22.05";
  };

  home.keyboard = { layout = "gb"; };

  imports = [
    ./programs/alacritty/default.nix
    ./programs/nvim/default.nix
    ./programs/git/default.nix
    ./programs/rofi/default.nix
    ./programs/fish/default.nix
    ./programs/waybar/default.nix

    ./services/syncthing/default.nix
    ./services/polybar/default.nix
    ./services/wayland/default.nix
  ];

  systemd.user.services.mpris-proxy = {
    Unit.Description = "Mpris proxy";
    Unit.After = [ "network.target" "sound.target" ];
    Service.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    Install.WantedBy = [ "default.target" ];
  };

  # xsession.windowManager.i3 =
  # import ./services/i3/default.nix { inherit pkgs lib; };
}
