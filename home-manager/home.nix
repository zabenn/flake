{
  inputs,
  outputs,
  ...
}:
{

  imports = [
    ../modules/home-manager
  ];

  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;

  nixpkgs = {
    overlays = [
      inputs.nix-vscode-extensions.overlays.default
      inputs.nur.overlays.default
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  xdg.userDirs.createDirectories = false;

  home.stateVersion = "26.05";
}
