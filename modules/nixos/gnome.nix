{
  config,
  pkgs,
  lib,
  ...
}:
{
  services = {
    displayManager.gdm = {
      enable = true;
      wayland = true;
      autoSuspend = false;
    };
    desktopManager.gnome.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  environment.etc."gdm/monitors.xml".source =
    ../../dotfiles/monitors + "/${config.networking.hostName}.xml";

  environment.systemPackages = with pkgs.gnomeExtensions; [
    paperwm
    transparent-top-bar-adjustable-transparency
    vertical-workspaces
    vscode-search-provider
  ];

  networking.firewall = {
    allowedTCPPorts = [
      4230
      7236
      7250
    ];
    allowedUDPPorts = [
      4230
      5353
      7236
    ];
  };
}
