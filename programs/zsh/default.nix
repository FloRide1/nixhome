{ lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./p10k-config;
        file = "p10k.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.1";
          sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
        };
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "colored-man-pages" "themes" ];
    };

    shellAliases = {
      v = "nvim";
      c = "clear";
      untar = "tar -xvzf";
      tarc = "tar -cvzf";
      mkdir = "mkdir -vp";
      rm = "rm -riv";
      cp = "cp -riv";
      mv = "mv -iv";
      cat = "bat -p";
      ls = "lsd";
      sl = "lsd";
      tree = "lsd --tree";
    };
  };
}
