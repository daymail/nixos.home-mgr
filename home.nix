{pkgs, ... }:{
  home.username = "src";
  home.homeDirectory = "/home/src";
  home.stateVersion = "25.11"; # Please read the comment before changing.
  imports = [./modules/main.nix];
  home.packages = with pkgs; [
    lua-language-server
  ];
  home.file = {
  };
  home.sessionVariables = {
  };
  programs.home-manager.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
