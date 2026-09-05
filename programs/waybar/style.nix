{
  config,
  pkgs,
  theme,
  ...
}:

{
  home.packages = [ pkgs.waybar ];

  xdg.configFile."waybar/style.css".text = ''
    * {
        font-family: CommitMono, "JetBrainsMono Nerd Font";
        font-size: 14px;
    }

    tooltip {
        background-color: #${theme.color.black};
        border-radius: 8px;
        border: none;
    }

    tooltip label {
        color: #${theme.color.blue};
        padding: 0px 0px;
        margin: 0px 1px;
    }

    /* Waybar background */
    window#waybar {
        background-color: rgba(0, 0, 0, 0);
    }

    /* === Workspaces === */
    /*
    The workspace buttons use a linear gradient to make the angle on the left side of the buttons.
    And a box shadow that bleeds into the next button on the right that gets cut at an angle by the linear
    gradient of the next button to the right.
    */

    #workspaces {
        transition: all 0s linear;
        border-radius: 0px;
        margin: 0px;
        /*background: linear-gradient(60deg, #${theme.color.black} calc(100% - 15px), transparent calc(100% - 15px));*/
        /* Make the workspace background black so the background is not visible through any transparent button parts */
        background: #${theme.color.black};
    }

    /* === Default workspace button === */
    #workspaces button {
        transition: all 0s linear;
        border-radius: 0px;
        color: #${theme.color.white};
        /* only the left side is angled, so only that side needs the extra 15px of padding */
        padding: 2px 0px 2px 15px;
        /* Undo the negative spacing in the waybar.nix file, this allows for the hover background colors to work properly */
        margin: 0px 0px 0px 0px;
        background: linear-gradient(60deg, transparent 15px, #${theme.color.black} 15px);
    }

    /* The first default workspace needs no angles */
    #workspaces button:nth-child(1) {
        /* neither side is angled, so no extra padding is needed */
        padding: 2px 0px;
    }

    /* The last default workspace needs margin to offset the window title bar */
    #workspaces button:nth-last-child(1) {
      margin-right: 20px;
    }

    /* === Hovering over workspaces === */
    #workspaces button:hover {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.brightWhite} 15px);
        box-shadow: 20px 0px 0px 0px #${theme.color.brightWhite};
        color: #${theme.color.black};
    }

    /* The first workspace needs no angles */
    #workspaces button:hover:nth-child(1) {
        background: #${theme.color.brightWhite};
    }

    /* === Active/Focused workspace === */
    #workspaces button.focused,
    #workspaces button.active {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.blue} 15px);
        box-shadow: 20px 0px 0px 0px #${theme.color.blue};
        color: #${theme.color.black};
    }

    /* The first active workspace needs no angles */
    #workspaces button.focused:nth-child(1),
    #workspaces button.active:nth-child(1) {
        background: #${theme.color.blue};
    }

    /* === Urgent workspace === */
    #workspaces button.urgent {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.red} 15px);
        box-shadow: 20px 0px 0px 0px #${theme.color.red};
        color: #${theme.color.black};
    }

    /* The first workspace needs no angles */
    #workspaces button.urgent:nth-child(1) {
        background: #${theme.color.red};
    }

    /* === Window title bar === */
    #window {
        padding: 2px calc(15px + 7px);
        background: linear-gradient(60deg, transparent 15px, #${theme.color.brightWhite} 15px, #${theme.color.brightWhite} calc(100% - 16px), transparent calc(100% - 15px));
        color: #${theme.color.black};
    }

    /* Window title bar when no windows are open */
    window#waybar.empty #window {
        padding: 0px calc(15px + 7px + 5px) 0px calc(15px + 2px);
        color: #${theme.color.cyan};
    }

    /* === Default icon config === */

    #battery,
    #cpu,
    #memory,
    #disk,
    #temperature,
    #backlight,
    #network,
    #bluetooth,
    #pulseaudio,
    #wireplumber,
    #tray,
    #mode,
    #idle_inhibitor,
    #custom-swaync {
        color: #${theme.color.blue};
        /* only the left side is angled, so only that side needs the extra 15px of padding */
        padding: 2px 7px 2px calc(15px + 7px);
        /* Undo the negative spacing in the waybar.nix file, this allows for the hover background colors to work properly */
        margin: 0px 20px 0px 0px;
        background: linear-gradient(60deg, transparent 15px, #${theme.color.white} 15px);
        box-shadow: 20px 0px 0px 0px #${theme.color.white};
    }

    /* === default on hover behavior === */
    #cpu:hover,
    #memory:hover,
    #network:hover,
    #bluetooth:hover,
    #backlight:hover,
    #pulseaudio:hover,
    #custom-swaync:hover {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.brightWhite} 15px);
        box-shadow: 20px 0px 0px 0px #${theme.color.brightWhite};
        color: #${theme.color.black};
    }

    /* === Modules === */
    #bluetooth {
        margin: 0px 0px 0px 0px;
        box-shadow: none;
        background: linear-gradient(60deg, transparent 15px, #${theme.color.brightCyan} 15px);
        color: #${theme.color.black};
    }

    #bluetooth:hover {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.brightWhite} 15px);
        color: #${theme.color.black};
    }

    #network {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.cyan} 15px);
        box-shadow: 20px 0px 0px 0px #${theme.color.cyan};
        color: #${theme.color.black};
    }

    #custom-swaync {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.blue} 15px);
        box-shadow: 20px 0px 0px 0px #${theme.color.blue};
        color: #${theme.color.black};
    }

    #pulseaudio {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.black} 15px);
        box-shadow: 20px 0px 0px 0px #${theme.color.black};
        color: #${theme.color.white};
    }

    #backlight {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.black} 15px);
        box-shadow: 20px 0px 0px 0px #${theme.color.black};
        color: #${theme.color.brightWhite};
    }

    #memory {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.cyan} 15px);
        box-shadow: 20px 0px 0px 0px #${theme.color.cyan};
        color: #${theme.color.black};
    }

    #cpu {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.brightCyan} 16px);
        box-shadow: 20px 0px 0px 0px #${theme.color.brightCyan};
        color: #${theme.color.black};
    }

    #cpu:hover {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.brightWhite} 16px);
        box-shadow: 20px 0px 0px 0px #${theme.color.brightWhite};
        color: #${theme.color.black};
    }

    /* === clock === */
    #clock {
        color: #${theme.color.brightWhite};
        font-weight: bold;
        background: linear-gradient(60deg, transparent 15px, #${theme.color.black} 16px, #${theme.color.black} calc(100% - 16px),  transparent calc(100% - 15px));
        box-shadow: 20px 0px 0px 0px #${theme.color.black};
        padding: 2px calc(15px + 7px);
    }

    /* === Battery === */

    #battery {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.blue} 15px);
        box-shadow: 20px 0px 0px 0px #${theme.color.blue};
        color: #${theme.color.black};
    }

    #battery:hover {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.brightWhite} 15px);
        box-shadow: 20px 0px 0px 0px #${theme.color.brightWhite};
        color: #${theme.color.black};
    }

    /* Battery charging */
    #battery.charging {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.black} 15px);
        box-shadow: 20px 0px 0px 0px #${theme.color.black};
        color: #${theme.color.green};
    }

    #battery.charging:hover {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.green} 15px);
        box-shadow: 20px 0px 0px 0px #${theme.color.green};
        color: #${theme.color.black};
    }

    /* Battery warning */
    #battery.warning:not(.charging) {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.black} 15px);
        box-shadow: 20px 0px 0px 0px #${theme.color.black};
        color: #${theme.color.yellow};
    }

    #battery.warning:not(.charging):hover {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.yellow} 15px);
        box-shadow: 20px 0px 0px 0px #${theme.color.yellow};
        color: #${theme.color.black};
    }

    /* Critical battery style */
    #battery.critical:not(.charging):hover,
    #battery.critical:not(.charging) {
        background: linear-gradient(60deg, transparent 15px, #${theme.color.red} 15px);
        box-shadow: 20px 0px 0px 0px #${theme.color.red};
        color: #${theme.color.black};
    }
  '';
}
