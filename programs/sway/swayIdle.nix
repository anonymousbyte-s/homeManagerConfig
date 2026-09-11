{
  config,
  pkgs,
  theme,
  ...
}:

{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 300; # 5 minutes
        command = "${pkgs.swaylock-effects}/bin/swaylock -f";
      }
      {
        timeout = 600; # 10 minutes
        command = "systemctl suspend";
      }
    ];
    events =
      {
        before-sleep = "${pkgs.swaylock-effects}/bin/swaylock -f";
      };

  };
}
