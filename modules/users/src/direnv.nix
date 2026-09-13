{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    silent = true;

    # custom stdlib written to $XDG_CONFIG_HOME/direnv/direnvrc
    stdlib = ''
      if declare -f use_flake >/dev/null; then
        eval "$(declare -f use_flake | sed '1s/use_flake/use_flake_original/')"
        use_flake() {
          if ! ping -c 1 -W 1 1.1.1.1 >/dev/null 2>&1; then
            echo "direnv: No network detected. Working offline."
            use_flake_original "$@" --offline
          else
            use_flake_original "$@"
          fi
        }
      fi
    '';
  };
}
