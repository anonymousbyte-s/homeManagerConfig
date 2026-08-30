{ pkgs, theme, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      safe.directory = "/etc/nixos";
      user = {
        name = "anonymousbyte-s";
        email = "td0984825@gmail.com";
      };
    };
  };
}
