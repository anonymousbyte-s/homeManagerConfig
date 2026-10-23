{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    # Automatically install extensions from nixpkgs
    extensions = with pkgs.vscode-extensions; [
      platformio.platformio-vscode-ide # platformIO
      # Add more extensions here
    ];

    # Declarative user settings (overwrites existing ~/.config/Code/User/settings.json)
    userSettings = {
      "editor.formatOnSave" = true;
      "workbench.colorTheme" = "darker-horizon";
      "telemetry.telemetryLevel" = "off";

      # Nix-IDE configurations
      #"nix.enableLanguageServer" = true;
      #"nix.serverPath" = "nixd"; # requires 'nixd' package installed
      #"nix.formatterPath" = "nixpkgs-fmt"; # requires 'nixpkgs-fmt' package installed
    };
  };
}
