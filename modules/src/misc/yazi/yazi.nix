{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    shellWrapperName = "y";
    settings = {
      manager = {
        show_hidden = true;
        sort_by = "natural";
        sort_sensitive = true;
        sort_dir_first = true;
      };
    };

    theme = {
      manager = {
        cwd = { fg = "#90E0F3"; }; # c8 (Cyan)
        hovered = { bg = "#3D3D3D"; fg = "#D0D9D7"; }; # c2 (Neovim Visual/CursorLine)
        preview_hovered = { bg = "#3D3D3D"; };
        find_keyword = { fg = "#F5CCD4"; bold = true; }; # c15 (Yellow search results)
        find_position = { fg = "#E0CEFD"; }; # c13 (Pastel Magenta)
      };

      status = {
        separator_open = "";
        separator_close = "";
        separator_style = { fg = "#3D3D3D"; bg = "#3D3D3D"; };
        mode_normal = { bg = "#90E0F3"; fg = "#181818"; bold = true; }; # Normal (Cyan)
        mode_select = { bg = "#DAFFEF"; fg = "#181818"; bold = true; }; # Visual (Bright White)
        mode_unset  = { bg = "#CE96A6"; fg = "#181818"; bold = true; }; # Replace (Pastel Red)
      };

      border = {
        style = { fg = "#646464"; }; # c3 (Bright Black)
      };

      filetype = {
        rules = [
          { mime = "image/*"; fg = "#F5CCD4"; }      # c15 (Yellow)
          { mime = "video/*"; fg = "#E0CEFD"; }      # c13 (Pastel Magenta)
          { mime = "audio/*"; fg = "#E0CEFD"; }      # c13 (Pastel Magenta)
          { mime = "text/*"; fg = "#82B8A9"; }       # Blue
          { mime = "application/zip"; fg = "#95D5B2"; } # c7 (Pastel Green)
          { mime = "application/x-tar"; fg = "#95D5B2"; } # c7 (Pastel Green)
          { mime = "application/pdf"; fg = "#90E0F3"; } # c8 (Cyan)
          { url = "*/"; fg = "#89C8BD"; bold = true; }  # c14 (Cyanish-Green Directories)
        ];
      };
    };
  };
}
