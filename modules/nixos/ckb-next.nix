{ pkgs, ... }:
{
  hardware.ckb-next = {
    enable = true;
    package = pkgs.ckb-next;
  };
}
