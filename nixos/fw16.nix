{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../hardware/fw16.nix
    ./configuration.nix
    inputs.nixos-hardware.nixosModules.framework-16-amd-ai-300-series
  ];

  networking.hostName = "fw16";

  environment.systemPackages = with pkgs; [
    framework-tool
    qmk_hid
  ];
}
