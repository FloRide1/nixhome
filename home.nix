{ config, pkgs, lib, ... }:

let 
	desktopPkgs = with pkgs; [
		discord
		spotify
		lxrandr
		i3lock-fancy
		flameshot
		steam
		syncthing
		nitrogen
	];

	shellPkgs = with pkgs; [
		# nvim
		xclip
		ripgrep

		# Shell
		any-nix-shell
		nodejs
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

		# Man
		clang-manpages
		man-pages
		posix_man_pages
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

		packages = desktopPkgs ++ shellPkgs;
		stateVersion = "21.05";
	};

	home.keyboard = {
		layout = "gb";
	};

	imports = [
		./programs/alacritty/default.nix
		./programs/nvim/default.nix
		./programs/zsh/default.nix
		./programs/git/default.nix
		./programs/rofi/default.nix

		./services/syncthing/default.nix
		./services/polybar/default.nix
    ];

	xsession.windowManager.i3 = import ./services/i3/default.nix {inherit pkgs lib; };
}
