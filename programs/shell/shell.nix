{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellApplication {
      name = "cpuFrequencyMenu";

      runtimeInputs = [
        pkgs.fuzzel
      ];

      text = ''
        # Path to CPU scaling info
        CPU_DIR="/sys/devices/system/cpu/cpufreq"

        # check that the cpu info files exist
        if [[ -f "$CPU_DIR/policy0/cpuinfo_max_freq" && -f "$CPU_DIR/policy0/cpuinfo_min_freq" ]]; then
            # Read the max hardware frequency (stored in kHz)
            MAX_KHZ=$(cat "$CPU_DIR/policy0/cpuinfo_max_freq")
            # Read the min hardware frequency (stored in kHz)
            MIN_KHZ=$(cat "$CPU_DIR/policy0/cpuinfo_min_freq")

            # Convert to MHz
            MAX_MHZ=$((MAX_KHZ / 1000))
            MIN_MHZ=$((MIN_KHZ / 1000))

            # make the frequency options string
            options="MAX\n"
            for (( i="$MAX_MHZ"; i>="$MIN_MHZ"; i -= 250 ))
            do
                options+="''${i}MHz\n"
            done
            # remove the last new line character from the end of the string
            options="''${options/%"\n"/}"
        else
            echo "CPU frequency scaling files not found. Are you running inside a VM?"
            exit 0
        fi

        # prompt the use to select a frequency
        chosen=$(echo -e "$options" | fuzzel --dmenu --prompt="CPU Max Frequency:")

        # Do nothing if the user presses Escape
        if [[ -z "$chosen" ]]; then
            exit 0
        fi

        # if the user selected the MAX option then set the chosen frequency to the max frequency
        if [ "$chosen" == "MAX" ]; then
            chosen=$(cat "$CPU_DIR/policy0/cpuinfo_max_freq")
        else # if the user selected a custom frequency
            # convert the users choice to a number
            chosen=''${chosen//[!0-9]/}

            # convert the number back to KHz
            chosen=$((chosen * 1000))
        fi

        for i in "$CPU_DIR"/policy*; do
            echo "$chosen" | SUDO_ASKPASS="$(which zenityAskPass)" sudo -A tee "$i/scaling_max_freq"
        done
      '';
    })

    (pkgs.writeShellApplication {
      name = "powerMenu";

      runtimeInputs = [
        pkgs.fuzzel
      ];

      text = ''
        rawValueArray=("performance" "balanced" "power-saver")
        outputArray=("  Performance" " 󰗑 Balanced" " 󱈏 Power Saver")

        currentMode=$(tlpctl get)

        availableModes=""

        # Loop through each value
        index=0
        for value in "''${rawValueArray[@]}"; do
            if [[ "$currentMode" == "$value" ]]; then
                availableModes+="󰄵"
            else
                availableModes+="󰄱"
            fi
            availableModes+=''${outputArray[index]}
            availableModes+="\n"
            ((index++))
        done

        availableModes=''${availableModes%"\n"}
        echo $availableModes

        # prompt the use to select a frequency
        chosen=$(echo -e $availableModes | fuzzel --dmenu --minimal-lines --index --prompt="Set power mode:")

        # Do nothing if the user presses Escape
        if [[ -z "$chosen" ]]; then
            exit 0
            fi

        tlpctl ''${rawValueArray[chosen]}
      '';
    })

    (pkgs.writeShellApplication {
      name = "zenityAskPass";

      runtimeInputs = [
        pkgs.zenity
      ];

      text = ''
        exec env GTK_THEME=Gruvbox-Dark \
          ${pkgs.zenity}/bin/zenity \
          --password \
          --title="Sudo Authentication"
      '';
    })
  ];
}
