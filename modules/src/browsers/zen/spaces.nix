{...}:{
  programs.zen-browser.profiles.default = {
    spacesForce = true;
    spaces = {

      "Main" = {
        id = "daab06da-a599-4ae8-98b9-30dbeb49bf03";
        position = 1000;
        icon = "⭐";
        container = 1;
        theme = {
          type = "gradient";
          colors = [{red = 255; green = 235; blue = 211; algorithm = "floating"; type = "explicit-lightness"; lightness = 35;}];
          opacity = 0.8;
          texture = 0.3;
        };
      };

      "Lab" = {
        id = "673bacc8-aadf-48db-895e-74d269d8b1f0";
        position = 2000;
        icon = "⚙️";
        container = 3;
        theme ={
          type = "gradient";
          colors = [{red = 136; green = 189; blue = 164; algorithm = "floating"; type = "explicit-lightness"; lightness = 30;}];
          opacity = 0.8;
          texture = 0.3;
        };
      };

      "nix" = {
        id = "789ca23a-971e-4c1a-9b00-214a63871db8";
        position = 3000;
        icon = "❄️";
        container = 3;
        theme = {
          type = "gradient";
          colors = [{red = 120; green = 180; blue = 162; algorithm = "floating"; type = "explicit-lightness"; lightness = 35;}];
          opacity = 0.8;
          texture = 0.3;
        };
      };
    };
  };
}
