{ pkgs, theme, ... }:

{
  programs.swaylock = {
    enable = true;

    package = pkgs.swaylock-effects;

    settings = {
      screenshots = true;

      clock = true;
      timestr = "%H:%M";
      datestr = "%a, %b %d";

      effect-blur = "7x5";

      indicator = true;
      indicator-radius = 100;
      indicator-thickness = 7;

      # ring colors
      ring-color = "00000000";
      ring-ver-color = "#${theme.color.blue}";
      ring-clear-color = "#${theme.color.blue}";
      ring-wrong-color = "#${theme.color.red}";
      ring-caps-lock-color = "#${theme.color.cyan}";

      # ring fill colors
      inside-color = "00000000";
      inside-ver-color = "00000000";
      inside-wrong-color = "00000000";
      inside-clear-color = "00000000";
      inside-caps-lock-color = "00000000";

      # ring outline colors
      line-color = "00000000";
      line-ver-color = "00000000";
      line-wrong-color = "00000000";
      line-clear-color = "00000000";
      line-caps-lock-color = "00000000";

      # highlight colors
      key-hl-color = "#${theme.color.blue}";
      separator-color = "00000000";
      caps-lock-key-hl-color = "#${theme.color.cyan}";
      bs-hl-color = "#${theme.color.red}";
      caps-lock-bs-hl-color = "#${theme.color.red}";

      # text color
      text-color = "#${theme.color.blue}";
      text-ver-color = "#${theme.color.blue}";
      text-wrong-color = "#${theme.color.red}";
      text-clear-color = "#${theme.color.blue}";
      text-caps-lock-color = "#${theme.color.cyan}";

      show-failed-attempts = true;
      ignore-empty-password = true;
    };
  };
}
