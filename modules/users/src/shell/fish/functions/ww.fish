function ww --description 'Sync theme with swww or hyprpaper'
    set -l current_wall ""
    if pgrep swww > /dev/null
        set -l swww_out (swww query | string match -r '/.*')
        if test -n "$swww_out"
            set current_wall $swww_out
        end
    end
    if test -z "$current_wall"
        set -l conf_path "$HOME/.config/hypr/hyprpaper.conf"
        if test -f "$conf_path"
            set current_wall (grep "wallpaper =" "$conf_path" | string split ',' | string trim)[2]
        end
    end
    if test -z "$current_wall" -o ! -f "$current_wall"
        echo (set_color red)"Error: Could not find an active wallpaper path."(set_color normal)
        return 1
    end
    wallwatch -w "$current_wall" $argv
end
