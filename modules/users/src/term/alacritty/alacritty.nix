{pkgs, lib,... }:{
  programs.alacritty = {
    enable = true;
    settings = lib.recursiveUpdate(builtins.fromTOML (builtins.readFile ./alacritty.toml)){
      terminal = {
        shell = {
          program = "${pkgs.fish}/bin/fish";
          args = ["--login"];
        };
      };
    };
  };
}
