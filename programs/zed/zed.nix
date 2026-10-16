{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    gnumake
    clang-tools
    gdb
    nixd
    nixfmt
  ];

  programs.zed-editor = {
    enable = true;
    extensions = [
      "darker-horizon" # theme
      "nix" # nix language server
    ];

    userSettings = {
      theme = "Darker Horizon";
      hour_format = "hour24";
      load_direnv = "direct";
    };
  };
}
