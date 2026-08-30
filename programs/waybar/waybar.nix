{
  config,
  pkgs,
  theme,
  ...
}:

{
  programs.waybar = {
    enable = true;

    # enable waybar as a service
    systemd = {
      enable = true;
    };

    #style = builtins.readFile ../waybar/style.css;
    settings = [
      {
        layer = "top";
        position = "top";
        height = 30;
        margin = "0 0 0 0";
        modules-left = [
          "sway/workspaces"
          "sway/window"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "cpu"
          "memory"
          "battery"
          "backlight"
          "pulseaudio"
          "network"
          "bluetooth"
        ];

        # Modules

        "sway/window" = {
          format = "{}";
          max-length = 50;
        };

        clock = {
          interval = 1;
          format = "{:%H:%M:%S}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "left";
            first-day-of-week = 1;
            on-scroll = 1;
            format = {
              months = "<span color='#ebdbb2'><b>{}</b></span>";
              days = "<span color='#a89984'><b>{}</b></span>";
              weeks = "<span color='#8ec07c'><b>W{}</b></span>";
              weekdays = "<span color='#fabd2f'><b>{}</b></span>";
              today = "<span color='#458588'><b><u>{}</u></b></span>";
            };
          };
        };

        cpu = {
          interval = 1;
          format = " {usage:3d}%";
        };

        memory = {
          interval = 1;
          format = " {used:5.2f}Gb";
          tooltip-format = " {used:.2f}/{total}Gb\n󰾴  {swapUsed:.2f}/{swapTotal}Gb";
        };

        battery = {
          interval = 1;
          states = {
            warning = 20;
            critical = 10;
          };
          format = "{icon} {capacity:3d}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰂄 {capacity}%";
          format-full = "󱟢";
          format-icons = [
            "󰂃"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };

        network = {
          interval = 1;
          on-click = "foot impala";
          format = "{ifname}";
          format-wifi = "{icon}";
          format-icons = [
            "󰤫"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format-ethernet = "{ifname} ";
          format-disconnected = "󰤭";
          tooltip-format = "{ifname}";
          tooltip-format-wifi = "{essid}\n{ipaddr}";
          tooltip-format-ethernet = "{ifname} ";
          tooltip-format-disconnected = "Disconnected";
          max-length = 50;
        };

        bluetooth = {
          format = "";
          on-click = "foot bluetui";
          format-connected = "{num_connections} 󰂱";
          tooltip-format = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        };

        backlight = {
          device = "intel_backlight";
          format = "{icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          tooltip-format = "{percent}%";
        };

        pulseaudio = {
          format = "{icon}";
          format-bluetooth = "{icon} ";
          format-muted = "󰝟";
          format-icons = {
            headphone = "";
            headset = "󰋎";
            phone = "";
            phone-muted = "";
            portable = "";
            car = "";
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          tooltip-format = "{volume}%";
          scroll-step = 1;
          max-volume = 100;
          on-click = "pavucontrol";
        };
      }
    ];
  };
}
