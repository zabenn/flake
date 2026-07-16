{ pkgs, lib, ... }:
{
  xdg.configFile."blender/${pkgs.lib.versions.majorMinor pkgs.blender.version}/extensions/user_default/cad_sketcher".source =
    pkgs.fetchFromGitHub {
      owner = "hlorus";
      repo = "CAD_Sketcher";
      rev = "main";
      sha256 = "sha256-RBTJ48tFsHw+ca7trk3rYv5xWN/Ctlvn8kQ+r7XZOq8=";
    };
  xdg.configFile."blender/${pkgs.lib.versions.majorMinor pkgs.blender.version}/extensions/user_default/gamerigtools".source =
    pkgs.fetchFromGitHub {
      owner = "BlenderBoi";
      repo = "GameRigTools";
      rev = "v4.3.0";
      sha256 = "CA1qjNeOFdFQ3ZsZnzQ2FS92v9+5WmmN1vt7ublIWyY=";
    };
  xdg.configFile."blender/${pkgs.lib.versions.majorMinor pkgs.blender.version}/extensions/user_default/looptools".source =
    "${
      pkgs.fetchgit {
        url = "https://projects.blender.org/extensions/mesh_looptools.git";
        rev = "refs/heads/main";
        sha256 = "wYYOL4nuSY81I0cBp0nbWndGqZhyrI5uMIXkWm3dMRg=";
      }
    }/source";

  xdg.configFile."blender/${pkgs.lib.versions.majorMinor pkgs.blender.version}/addons/scripts/expy_kit".source =
    "${pkgs.fetchFromGitHub {
      owner = "pKrime";
      repo = "Expy-Kit";
      rev = "main";
      sha256 = "HMjyPzFXzt+8+X9RC+9HzolSsIJzv7EfvTP6578xqRc=";
    }}";

  xdg.configFile."blender/${pkgs.lib.versions.majorMinor pkgs.blender.version}/extensions/blender_org".source =
    pkgs.runCommand "blender-org-extensions" { } ''
      mkdir -p $out
    '';

  xdg.configFile."blender/${pkgs.lib.versions.majorMinor pkgs.blender.version}/config/userpref.blend".source =
    ../../dotfiles/blender/userpref.blend;
}
