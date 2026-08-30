{
  config,
  pkgs,
  theme,
  ...
}:

let
  modifier = "Mod4";
  terminal = "foot";
  menu = "fuzzel";
  fileManager = "thunar";
  left = "h";
  right = "l";
  up = "k";
  down = "j";
in
{
  # copy the wallpaper file in the current directory to a wallpaper directory
  home.file."Pictures/wallPapers/wallpaper.png".source = ./wallpaper.png;

  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;

    config = {
      startup = [
        # reload waybar whenever the wm is restarted
        {
          command = "systemctl --user restart waybar";
          always = true;
        }
      ];

      # disable the built in bar as we are using waybar
      bars = [ ];

      output = {
        "*" = {
          bg = "${config.home.homeDirectory}/Pictures/wallPapers/wallpaper.png fill";
        };
      };

      keybindings = {
        # start the terminal
        "${modifier}+t" = "exec ${terminal}";
        # Start your launcher
        "Alt+space" = "exec ${menu}";
        # Start your file manager
        "${modifier}+f" = "exec ${fileManager}";
        # kill the focused window
        "Alt+Shift+q" = "kill";
        # reload sway
        "${modifier}+Shift+c" = "reload";
        # Lock the screen
        "${modifier}+Escape" = "exec swaylock";
        # ADD A REALOD WAYBAR COMMAND

        "${modifier}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";

        # Special keys to adjust volume via PulseAudio
        "--locked XF86AudioRaiseVolume" =  "exec wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
        "--locked XF86AudioLowerVolume" = "exec wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-";
        "--locked XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "--locked XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";

        # Special keys to control media via playerctl
        "--locked XF86AudioPlay" = "exec playerctl play-pause";
        "--locked XF86AudioPause" = "exec playerctl play-pause";
        "--locked XF86AudioPrev" = "exec playerctl previous";
        "--locked XF86AudioNext" = "exec playerctl next";
        "--locked XF86AudioStop" = "exec playerctl stop";

        # Special keys to adjust brightness via brightnessctl
        "--locked XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "--locked XF86MonBrightnessUp" = "exec brightnessctl set 5%+";

        # Special key to take a screenshot with grim
        "Print" = "exec grim";

        # Toggle the current focus between tiling and floating mode
        "${modifier}+Shift+space" = "floating toggle";

        # Swap focus between the tiling area and the floating area
        "${modifier}+space" = "focus mode_toggle";

        # move windows around
        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Right" = "move right";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Down" = "move down";
        "${modifier}+Shift+${left}" = "move left";
        "${modifier}+Shift+${right}" = "move right";
        "${modifier}+Shift+${up}" = "move up";
        "${modifier}+Shift+${down}" = "move down";

        # focus commands
        "${modifier}+Left" = "focus left";
        "${modifier}+Right" = "focus right";
        "${modifier}+Up" = "focus up";
        "${modifier}+Down" = "focus down";
        "${modifier}+${left}" = "focus left";
        "${modifier}+${right}" = "focus down";
        "${modifier}+${up}" = "focus up";
        "${modifier}+${down}" = "focus right";

        # Switch to workspace
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";
        # Move focused container to workspace
        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";

        # Switch tiling mode
        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";

        # Switch new window direction
        "${modifier}+b" = "splith";
        "${modifier}+v" = "splitv";

        # Resize mode
        "${modifier}+r" = "mode \"resize\"";
      };

      modes = {
        resize = {
          # Binds arrow keys to resizing commands
          ${left} = "resize shrink width 10 px";
          ${down} = "resize grow height 10 px";
          ${up} = "resize shrink height 10 px";
          ${right} = "resize grow width 10 px";

          "Left" = "resize shrink width 10 px";
          "Down" = "resize grow height 10 px";
          "Up" = "resize shrink height 10 px";
          "Right" = "resize grow width 10 px";

          # Exit resize mode
          "Escape" = "mode default";
          "Return" = "mode default";
        };
      };

      colors = {
        focused = {
          border = "#${theme.color.blue}";
          background = "#${theme.color.blue}";
          text = "#${theme.color.black}";
          indicator = "#${theme.color.blue}";
          childBorder = "#${theme.color.blue}";
        };

        focusedInactive = {
          border = "#${theme.color.black}";
          background = "#${theme.color.black}";
          text = "#${theme.color.black}";
          indicator = "#${theme.color.brightBlack}";
          childBorder = "#${theme.color.brightBlack}";
        };

        unfocused = {
          border = "#${theme.color.black}";
          background = "#${theme.color.black}";
          text = "#${theme.color.black}";
          indicator = "#${theme.color.brightBlack}";
          childBorder = "#${theme.color.brightBlack}";
        };
      };

      window = {
        border = 2;
        titlebar = false;
      };

      floating = {
        border = 2;
        titlebar = false;
      };

      gaps = {
        # gaps between windows
        inner = 5;

        # gaps between windows and screen edges
        outer = -5;

        smartBorders = "no_gaps";
      };

      /*
        ### Idle configuration
        #
        # Example configuration:
        #
        # exec swayidle -w \
        #      timeout 300 'swaylock -f -c 000000' \
        #      timeout 600 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
        #      before-sleep 'swaylock -f -c 000000'
        #
        # This will lock your screen after 300 seconds of inactivity, then turn off
        # your displays after another 300 seconds, and turn your screens back on when
        # resumed. It will also lock your screen before your computer goes to sleep.


        #
        # Scratchpad:
        #
        # Sway has a "scratchpad", which is a bag of holding for windows.
        # You can send windows there and get them back later.

        # Move the currently focused window to the scratchpad
        bindsym $mod+Shift+minus move scratchpad

        # Show the next scratchpad window or hide the focused scratchpad window.
        # If there are multiple scratchpad windows, this command cycles through them.
        bindsym $mod+minus scratchpad show

      */

      focus.followMouse = false;
    };
  };
}
