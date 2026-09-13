fish_add_path ~/.local/bin

function fish_greeting
  alias v="nvim"
  alias ff="fastfetch"
  alias cls="clear"
  alias ls="ls --color=auto"
  alias hypr="v .config/hypr/hyprland.lua"
  alias matrix="cmatrix -C white"
  alias nix-cfg="sudo nvim /etc/nixos/configuration.nix"
  alias nix-rebuild="sudo nixos-rebuild switch"
  alias nix-home="nvim ~/.config/home-manager/"
end

export MANPAGER="nvim +Man!"
