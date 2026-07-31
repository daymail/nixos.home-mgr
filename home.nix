{pkgs, ... }:{
  home.username = "src";
  home.homeDirectory = "/home/src";
  home.stateVersion = "25.11"; # Please read the comment before changing.
  imports = [./modules/src/main.nix];
  home.packages = with pkgs; [
    fzf
    lazygit
  ];
  home.file = {
  };
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "zen-twilight";
  };

  programs.home-manager.enable = true;
}
