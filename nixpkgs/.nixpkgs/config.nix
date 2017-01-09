{
  packageOverrides = pkgs_: with pkgs_; {
    all = with pkgs; buildEnv {
      name = "all";
      paths = [
        fira-mono
        anonymousPro
        fzf
        ranger
        vlc
        compton
        xorg.xbacklight
        xsel
        ag
        htop
        tree
        stow
        vim
        git
        gitAndTools.hub
        termite
        google-chrome
        feh
        font-awesome-ttf
        i3blocks-gaps
        direnv
        spotify
        ncmpcpp
        zathura
        slack
        emojione
      ];
    };
  };
}
