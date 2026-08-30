{ pkgs, theme, ... }:

{
  # set the default terminal to use
  xdg.configFile."xfce4/helpers.rc".text = ''
    TerminalEmulator=foot
    TerminalEmulatorDismissed=true
  '';
  programs.foot = {
    enable = true;

    settings = {
      main = {
        #shell=/bin/bash
        font = "JetBrainsMono Nerd Font:size=7";
        font-bold = "JetBrainsMono Nerd Font:style=Bold:size=7";
        font-italic = "JetBrainsMono Nerd Font:style=Italic:size=7";
        font-bold-italic = "JetBrainsMono Nerd Font:style=Bold Italic:size=7";
        dpi-aware = "yes";
        #pad=12x12
      };

      scrollback = {
        lines = 5000;
        multiplier = 3.0;
      };

      mouse = {
        hide-when-typing = "yes";
      };

      colors-dark = {
        alpha = 0.95;
        foreground = "${theme.color.brightWhite}";
        background = "${theme.color.black}";

        # Normal colors
        regular0 = "${theme.color.black}"; # black
        regular1 = "${theme.color.red}"; # red
        regular2 = "${theme.color.green}"; # green
        regular3 = "${theme.color.yellow}"; # yellow
        regular4 = "${theme.color.blue}"; # blue
        regular5 = "${theme.color.magenta}"; # magenta
        regular6 = "${theme.color.cyan}"; # cyan
        regular7 = "${theme.color.white}"; # white

        # Bright colors
        bright0 = "${theme.color.brightBlack}"; # bright black
        bright1 = "${theme.color.brightRed}"; # bright red
        bright2 = "${theme.color.brightGreen}"; # bright green
        bright3 = "${theme.color.brightYellow}"; # bright yellow
        bright4 = "${theme.color.brightBlue}"; # bright blue
        bright5 = "${theme.color.brightMagenta}"; # bright magenta
        bright6 = "${theme.color.brightCyan}"; # bright cyan
        bright7 = "${theme.color.brightWhite}"; # bright white
      };

      key-bindings = {
        scrollback-up-page = "Shift+Page_Up";
        scrollback-down-page = "Shift+Page_Down";
        clipboard-copy = "Control+Shift+c";
        clipboard-paste = "Control+Shift+v";
        search-start = "Control+Shift+r";
        font-increase = "Control+plus";
        font-decrease = "Control+minus";
        font-reset = "Control+0";
      };
    };
  };

}

/*
  [main]
  #shell=/bin/bash
  font=JetBrainsMono Nerd Font:size=7
  font-bold=JetBrainsMono Nerd Font:style=Bold:size=7
  font-italic=JetBrainsMono Nerd Font:style=Italic:size=7
  font-bold-italic=JetBrainsMono Nerd Font:style=Bold Italic:size=7
  dpi-aware=yes
  #pad=12x12

  [scrollback]
  lines=5000
  multiplier=3.0

  [cursor]
  style=block
  #color=2e3440 d8dee9
  blink=yes

  [mouse]
  hide-when-typing=yes

  [colors-dark]
  alpha=0.95
  foreground=ebdbb2
  background="${theme.color.black}"

  # Normal colors
  regular0="${theme.color.black}"  # black
  regular1="${theme.color.red}"  # red
  regular2=98971a  # green
  regular3="${theme.color.yellow}"  # yellow
  regular4=458588  # blue
  regular5=b16286  # magenta
  regular6=689d6a  # cyan
  regular7=a89984  # white

  # Bright colors
  bright0=928374   # bright black
  bright1=fb4934   # bright red
  bright2=b8bb26   # bright green
  bright3=fabd2f   # bright yellow
  bright4=83a598   # bright blue
  bright5=d3869b   # bright magenta
  bright6=8ec07c   # bright cyan
  bright7=ebdbb2   # bright white

  [key-bindings]
  scrollback-up-page=Shift+Page_Up
  scrollback-down-page=Shift+Page_Down
  clipboard-copy=Control+Shift+c
  clipboard-paste=Control+Shift+v
  search-start=Control+Shift+r
  font-increase=Control+plus
  font-decrease=Control+minus
  font-reset=Control+0
*/
