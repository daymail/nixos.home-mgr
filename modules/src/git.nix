{...}:{
  programs.git ={
    enable = true;
    ignores = [
      "*.local"
      ".direnv/"
    ];

    settings = {
      user = {
        name = "daymail";
        email = "elvisgmagu@gmail.com";
      };
      alias = {
        st = "status";
        br = "branch";
        cm = "commit -m";
        co = "checkout";
        lg = "log --graph --oneline --decorate --all";
      };
      core.editor = "vim";
      init = {defaultBranch = "main";};
    };
  };
}

#LINK: https://nix-community.github.io/home-manager/options/home-manager/programs/git.html
#LINK: https://home-manager-options.extranix.com/?query=programs.git&release=release-26.05
