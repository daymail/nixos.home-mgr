{
  programs.btop = {
    enable = true;
    extraConfig = builtins.readFile ./btop.conf;
    settings = {
      color_theme = "pastel_dark";
      theme_background = true;
    };
    themes = {
      pastel_dark = ''
# Main UI Colors
        theme[main_bg]="#181818"
        theme[main_fg]="#D0D9D7"
        theme[title]="#DCFFFD"
        theme[hi_fg]="#DAFFEF"
        theme[selected_bg]="#3D3D3D"
        theme[selected_fg]="#DAFFEF"
        theme[inactive_fg]="#646464"
        theme[graph_text]="#8C9C9A"
        theme[proc_misc]="#E0CEFD"

# Box Borders and Split Lines
        theme[cpu_box]="#3D3D3D"
        theme[mem_box]="#3D3D3D"
        theme[net_box]="#3D3D3D"
        theme[proc_box]="#3D3D3D"
        theme[div_line]="#3D3D3D"

# Temperature Gradients
        theme[temp_start]="#95D5B2"
        theme[temp_mid]="#90E0F3"
        theme[temp_end]="#CE96A6"

# CPU Usage Gradients
        theme[cpu_start]="#95D5B2"
        theme[cpu_mid]="#90E0F3"
        theme[cpu_end]="#CE96A6"

# Memory Box Gradients (Free vs Used)
        theme[free_start]="#CE96A6"
        theme[free_mid]="#90E0F3"
        theme[free_end]="#95D5B2"

        theme[cached_start]="#82B8A9"
        theme[cached_mid]="#B4E1EB"
        theme[cached_end]="#E0CEFD"

        theme[available_start]="#CE96A6"
        theme[available_mid]="#90E0F3"
        theme[available_end]="#95D5B2"

        theme[used_start]="#95D5B2"
        theme[used_mid]="#90E0F3"
        theme[used_end]="#CE96A6"

# Network Box Gradients
        theme[download_start]="#95D5B2"
        theme[download_mid]="#78C6A3"
        theme[download_end]="#90E0F3"

        theme[upload_start]="#82B8A9"
        theme[upload_mid]="#B4E1EB"
        theme[upload_end]="#E0CEFD"

# Processes Box Gradients
        theme[process_start]="#82B8A9"
        theme[process_mid]="#90E0F3"
        theme[process_end]="#CE96A6"
      '';
      };
  };
}
