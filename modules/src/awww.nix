{config, pkgs, ...}:{
  services.awww = {
    enable = true;
  };
  home.packages = [pkgs.awww];
  systemd.user.services.init-wallpaper = {
    Unit = {
      Description = "Set default wallpaper via awww";
      After = ["awww.service"];
      Requires = ["awww.service"];
      PartOf = ["graphical-session.target"];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.awww}/bin/awww img ${../../assets/default-wall.jpg} --transition-type fade --transition-duration 2";
      RemainAfterExit = true;
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
