{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
  ];
  programs.dank-material-shell = {
    enable = true;
    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
  };
  home.packages = [ pkgs.yamis-icon-theme ];

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "yet-another-monochrome-icon-set";
      package = pkgs.yamis-icon-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  home.activation.dmsSettings = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    settingsFile="$HOME/.config/DankMaterialShell/settings.json"
    mkdir -p "$(dirname "$settingsFile")"
    [ -f "$settingsFile" ] || echo '{}' > "$settingsFile"
    tmp="$(mktemp)"
    ${pkgs.jq}/bin/jq \
      '.gtkThemingEnabled = true
       | .qtThemingEnabled = true
       | .terminalsAlwaysDark = true
       | .spotlightModalViewMode = "grid"
       | .iconThemeDark = "yet-another-monochrome-icon-set"
       | .iconThemeLight = "yet-another-monochrome-icon-set"' \
      "$settingsFile" > "$tmp" && mv "$tmp" "$settingsFile"
  '';
}
