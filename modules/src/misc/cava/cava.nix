{
  programs.cava = {
    enable = true;
    settings = {
      color = {
        gradient = 1;
        gradient_color_1  = "'#3B3B3C'";
        gradient_color_2  = "'#474949'";
        gradient_color_3  = "'#545756'";
        gradient_color_4  = "'#616563'";
        gradient_color_5  = "'#6D7371'";
        gradient_color_6  = "'#7A817E'";
        gradient_color_7  = "'#878F8B'";
        gradient_color_8  = "'#949D99'";
        gradient_color_9  = "'#A0ABA6'";
        gradient_color_10 = "'#ADB9B3'";
        gradient_color_11 = "'#BAC7C0'";
        gradient_color_12 = "'#C6D5CE'";
        gradient_color_13 = "'#D3E3DB'";
        gradient_color_14 = "'#E0F1E8'";
        gradient_color_15 = "'#EDFFF6'";
      };

      general = {
        # framerate = 60;
        # bars = 0;
        # bar_width = 2;
        # bar_spacing = 1;
      };

      input = {
        # method = "pipewire";
        # source = "auto";
      };

      output = {
        # method = "noncurses";
        # channels = "stereo";
      };

      smoothing = {
        # noise_reduction = 77;
      };
    };
  };
}
