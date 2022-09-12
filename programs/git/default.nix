{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "FloRide1";
    userEmail = "florian.reimat@orange.fr";
    extraConfig = {
      init.defaultBranch = "master";
      pull.ff = "true";

      core.editor = "nvim";
      core.pager = "${pkgs.delta}/bin/delta --dark";

      merge.tool = "fugitive";
      mergetool.fugitive.cmd = "nvim -f -c Gvdiffsplit! $LOCAL $REMOTE $MERGED";
    };
    aliases = {
      mr =
        "!sh -c 'git fetch $1 merge-requests/$2/head:mr-$1-$2 && git checkout mr-$1-$2' -";
      l =
        "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
      whoops = "reset --hard";
      back = "reset --hard HEAD^";
    };
    ignores = [
      # Swap
      "[._]*.s[a-v][a-z]"
      "[._]*.sw[a-p]"
      "[._]s[a-rt-v][a-z]"
      "[._]ss[a-gi-z]"
      "[._]sw[a-p]"

      # Session
      "Session.vim"
      "Sessionx.vim"

      # Temporary
      ".netrwhist"
      "*~"

      # Auto-generated tag files
      "tags"

      # Persistent undo
      "[._]*.un~"
    ];
  };
}
