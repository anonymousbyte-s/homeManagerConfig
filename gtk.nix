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
      name = "Posy_Cursor_Mono_Black";
      package = pkgs.posy-cursors;
    };

    font = {
      name = "CommitMono";
      size = 10;
    };
  };
}
