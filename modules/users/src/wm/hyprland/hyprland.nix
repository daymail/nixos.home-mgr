{pkgs, ...}:{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    configType = "hyprlang";
    extraConfig = builtins.readFile ./hyprland.lua;
  };
}
