{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    mouse = false;
    shortcut = "a";
    terminal = "screen-256color";
    extraConfig = ''
      ${builtins.readFile ./keybinds.conf}
      ${builtins.readFile ./theme.conf}
    '';
  };

  home.file = {
    ".local/bin/tmux-dev" = {
      source = ./sessions/dev;
      executable = true;
    };
    ".local/bin/tmux-sys" = {
      source = ./sessions/sys;
      executable = true;
    };
  };
}
