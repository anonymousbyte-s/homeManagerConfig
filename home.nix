{ config, pkgs, ... }:

let
  theme = import ./theme.nix;
in
{
  # Import each config file
  imports = [
    ./fuzzel.nix # fuzzel search bar config
    ./gtk.nix # gtk theme

    # waybar
    ./programs/waybar/style.nix # waybar style.css
    ./programs/waybar/waybar.nix # waybar config

    # sway
    ./programs/sway/sway.nix # sway wm
    ./programs/swayLock/swayLock.nix # screen locker for the sway wm
    ./programs/swaync/swaync.nix # sway notification daemon

    ./programs/foot/foot.nix # terminal

    ./programs/fastfetch/fastfetch.nix # fast fetch

    ./programs/git/git.nix # git

    ./programs/shell/shell.nix # custom shell applications

    ./programs/bash/bash.nix # bash config
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tom";
  home.homeDirectory = "/home/tom";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # pass the theme colors to all modules
  _module.args.theme = theme;

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # desktop apps
    pkgs.firefox # web browser
    pkgs.zed-editor # text editor
    pkgs.qalculate-gtk # calculator
    pkgs.libreoffice # office application suite
    pkgs.vlc # media player
    pkgs.gimp # image viewer and editor

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tom/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    TERMINAL = "foot";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
