{
  inputs,
  ...
}:
{
  imports = [
    inputs.dms.nixosModules.dank-material-shell
    inputs.dms.nixosModules.greeter
    inputs.niri.nixosModules.niri
  ];

  programs = {
    dank-material-shell = {
      enable = true;
      greeter = {
        enable = true;
        compositor.name = "niri";
        configHome = "/home/sam";
      };
    };
    niri.enable = true;
  };

  security.pam.services.greetd.fprintAuth = true;

  services.upower.enable = true;

  documentation.nixos.enable = false;
}
