{ config, pkgs, ... }:

{
	programs.git = {
		enable = true;
		userName = "FloRide1";
		userEmail = "florian.reimat@orange.fr";
		extraConfig = {
			init.defaultBranch = "master";
		};
		delta = {
			enable = true;
		};
	};
}
