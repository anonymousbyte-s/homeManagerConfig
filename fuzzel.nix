{ config, pkgs, theme, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "CommitMono:size=12";
        terminal = "${pkgs.foot}/bin/foot";
        layer = "overlay";
      };
      colors = {
        background = "${theme.color.black}ff";
        text = "${theme.color.brightWhite}ff";
        match = "${theme.color.blue}ff";
        selection = "${theme.color.blue}cff";
        selection-text = "${theme.color.black}ff";
        selection-match = "${theme.color.red}ff";
        border = "${theme.color.blue}ff";
        input = "${theme.color.blue}ff";
      };
      border = {
        radius = 8;
      };
    };
  };
}
