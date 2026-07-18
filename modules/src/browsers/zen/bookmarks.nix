{
  programs.zen-browser.profiles.default.bookmarks = {
    force = true;
    settings = [
      {
        name = "Nix";
        toolbar = true;
        bookmarks =[
          {name = "homepage"; url = "https://nixos.org/";}
          {name = "wiki"; url = "https://wiki.nixos.org/"; tags = ["wiki" "nix"];}
          {name = "packages"; url = "https://search.nixos.org/packages";}
        ];
      }

      {
        name = "Dev";
        bookmarks = [
          {name = "Github"; url = "https://github.com";}
          {name = "Cobalt"; url = "https://cobalt.tools/";}
        ];
      }
      {
        name = "UI";
        bookmarks =[
          {name = "Palette Hunt"; url = "https://colorhunt.co/";}
          {name = "Color extract"; url = "https://redketchup.io/color-picker";}
          {name = "Coloors"; url = "https://coolors.co/";}
        ];
      }

    ];
  };
}
