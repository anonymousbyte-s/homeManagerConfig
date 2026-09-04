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

    window#waybar {
        background-color: rgba(0, 0, 0, 0);
    }

    /* === Workspaces === */

    #workspaces {
        background-color: #${theme.color.black};
        margin: 3px 3px;
        border-radius: 8px;
    }

    #workspaces button {
        padding: 0px 0px;
        color: #${theme.color.white};
        border-radius: 8px;
        border: none;
        background: transparent;
    }

    /* Active/Focused workspace */
    #workspaces button.focused,
    #workspaces button.active {
        background-color: #${theme.color.blue};
        color: #${theme.color.black};
    }

    /* Hovering over workspace buttons */
    #workspaces button:hover {
        background-color: #${theme.color.white};
        color: #${theme.color.black};
        box-shadow: none;
    }

    /* Workspace requiring urgent attention */
    #workspaces button.urgent {
        background-color: #${theme.color.brightRed};
        color: #${theme.color.black};
    }

    /* Windows */
    window#waybar.empty #window {
        background: transparent;
        padding: 0;
        margin: 0;
    }

    /* === Default icon config === */

    #clock,
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
    #window,
    #custom-swaync {
        background-color: #${theme.color.black};
        color: #${theme.color.blue};
        padding: 2px 7px;
        /*margin: 3px 3px;*/
        /*border-radius: 8px;*/
    }

    /* === default on hover behavior === */
    #cpu:hover,
    #memory:hover,
    #network:hover,
    #bluetooth:hover,
    #pulseaudio:hover,
    #custom-swaync:hover {
        background-color: #${theme.color.blue};
        color: #${theme.color.black};
    }

    /* === Spacing fixes === */
    #backlight {
        padding-left: 7px;
        padding-right: 9px;
    }

    #network {
        padding-left: 6px;
        padding-right: 12px;
    }

    #bluetooth {
        padding: 2px 7px;
    }

    #pulseaudio {
        padding-left: 7px;
        padding-right: 9px;
    }

    /* === backlight module === */
    #backlight {
        color: #${theme.color.brightWhite};
    }

    #backlight:hover {
        color: #${theme.color.black};
        background-color: #${theme.color.brightWhite};
    }

    /* === clock === */
    #clock {
        background-color: rgba(0, 0, 0, 0);
        color: #${theme.color.brightWhite};
        font-weight: bold;
    }

    /* === Battery === */

    #battery:hover {
        background-color: #${theme.color.blue};
        color: #${theme.color.black};
    }

    /* Battery charging */
    #battery.charging {
        background-color: #${theme.color.black};
        color: #${theme.color.green};
    }

    #battery.charging:hover {
        background-color: #${theme.color.green};
        color: #${theme.color.black};
    }

    /* Battery warning */
    #battery.warning:not(.charging) {
        background-color: #${theme.color.black};
        color: #${theme.color.yellow};
    }

    #battery.warning:not(.charging):hover {
        background-color: #${theme.color.yellow};
        color: #${theme.color.black};
    }

    /* Critical battery style */
    #battery.critical:not(.charging):hover,
    #battery.critical:not(.charging) {
        background-color: #${theme.color.red};
        color: #${theme.color.black};
    }
  '';
}
