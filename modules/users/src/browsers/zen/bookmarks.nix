{
  programs.zen-browser.profiles.default.bookmarks = {
    force = true;
    settings = [
      {
        name = "Home";
        toolbar = true;
        bookmarks =[
          {name = "Youtube"; url = "https://youtube.com";}
          {name = "Monkeytype"; url = "https://monkeytype.com";}
          {name = "Movy"; url = "https://www.movy.bz/";}
          {name = "1flex"; url = "https://www.1flex.org/";}
          {name = "fmhy-movies"; url = "https://fmhy.net/video#movies";}  #free-movies-heck-yeah
          {name = "fmhy-anime"; url = "https://fmhy.net/video#anime-streaming";}
          {name = "Everything Moe"; url = "https://www.everythingmoe.com/";}

        ];
      }

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
          {name = "CodeForces"; url = "https://codeforces.com/";}
          {name = "OS Wiki"; url = "https://wiki.osdev.org/Expanded_Main_Page";}
          {name = "Archive"; url = "https://archive.org/";}
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
