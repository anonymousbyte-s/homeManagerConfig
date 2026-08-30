{
  config,
  pkgs,
  theme,
  ...
}:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "~/Pictures/fastFetchLogos/NixOS.png";
        type = "sixel";
        height = 20;
        padding = {
          top = 0;
          left = 2;
          right = 2;
        };
      };

      display = {
        # title = user@hostname
        # keys = module name
        color = {
          keys = "blue";
          title = "light_blue";
        };

        # percentage bars
        bar = {
          width = 10;
          char = {
            elapsed = "■";
            total = "-";
          };
        };

        # configure percentage type
        percent = {
          type = 3; # 1=number; 2=bar; 3=both; 9=colored number
          color = {
            green = "green";
            yellow = "light_yellow";
            red = "light_red";
          };
        };
      };

      modules = [
        "title"
        #"separator"
        # OS
        {
          type = "os";
          key = " OS";
          keyColor = "blue";
        }
        {
          type = "kernel";
          key = "├ Kernel";
          keyColor = "blue";
        }
        {
          type = "uptime";
          key = "├ Up time";
          keyColor = "blue";
        }
        {
          type = "packages";
          key = "├ Packages ";
          keyColor = "blue";
        }
        {
          type = "shell";
          key = "└ Shell";
          keyColor = "blue";
        }
        "break"

        # desktop enviroment
        {
          type = "wm";
          key = " WM";
          keyColor = "light_blue";
        }
        {
          type = "lm";
          key = "├ Login Manager";
          keyColor = "light_blue";
        }
        {
          type = "theme";
          key = "├󰏘 Theme";
          keyColor = "light_blue";
        }
        {
          type = "icons";
          key = "├ Icons";
          keyColor = "light_blue";
        }
        {
          type = "font";
          key = "├ Font";
          keyColor = "light_blue";
        }
        {
          type = "font";
          key = "├ Terminal";
          keyColor = "light_blue";
        }
        {
          type = "font";
          key = "└ Terminal Font";
          keyColor = "light_blue";
        }
        "break"

        # hardware
        {
          type = "host";
          key = "󰌢 Host";
          keyColor = "cyan";
          format = "{family} V{version}";
        }
        {
          type = "display";
          key = "├󰍹 Display";
          keyColor = "cyan";
        }
        {
          type = "cpu";
          key = "├ CPU";
          keyColor = "cyan";
          format = "{name} {cores-online}@{freq-max}";
        }
        {
          type = "gpu";
          key = "├󰾲 GPU";
          keyColor = "cyan";
          format = "{name} @{frequency}";
        }
        {
          type = "memory";
          key = "├ RAM";
          keyColor = "cyan";
        }
        {
          type = "swap";
          key = "├󰾴 Swap";
          keyColor = "cyan";
        }
        {
          type = "disk";
          key = "├ Disk";
          keyColor = "cyan";
          format = "{size-percentage-bar} {size-used} / {size-total}";
        }
        {
          type = "battery";
          key = "└󰁹 Battery";
          keyColor = "cyan";
          format = "{capacity-bar} {capacity}  {cycle-count}";
        }
        "break"
        {
          type = "custom";
          format = "{#red} {#yellow} {#green} {#cyan} {#blue} {#magenta} {#light_white} {#white} {#light_black} {#black}";
        }
      ];
    };
  };
}
