{ config, pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "Gruvbox-Dark";
    };

    iconTheme = {
      name = "MoreWaita";
      package = pkgs.morewaita-icon-theme;
    };

    cursorTheme = {
      #name = "Nordzy-white-cursors";
      package = pkgs.posy-cursors;
    };

    font = {
      name = "CommitMono";
      size = 10;
    };
  };
}
