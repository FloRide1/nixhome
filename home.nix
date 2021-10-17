{ config, pkgs, ... }:

let 
    defaultPkgs = with pkgs; [
    ];

    shellPkgs = with pkgs; [
        # nvim
        nodejs

        # Font
        meslo-lgs-nf

        # Shell
        any-nix-shell
        fishPlugins.foreign-env

        # Utility
        htop
        cheat
        neofetch
        lsd
        bat
        delta
    ];

in
{
    programs.home-manager.enable = true;
    
    nixpkgs.config = {
        allowUnfree = true;
    };

    home = {
        username = "floride";
        homeDirectory = "/home/floride";

        packages = defaultPkgs ++ shellPkgs;
        stateVersion = "21.11";
    };

    home.keyboard = {
        layout = "gb";
    };

    imports = [
        # ./programs/alacritty/default.nix
        ./programs/nvim/default.nix
        ./programs/fish/default.nix
    ];
}
