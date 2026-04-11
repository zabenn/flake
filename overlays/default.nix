{ inputs, ... }:
{
  additions = final: _prev: import ../pkgs final.pkgs;

  modifications = final: prev: {
    vscode-extensions = prev.vscode-extensions // {
      eddiedover = (prev.vscode-extensions.eddiedover or { }) // {
        gdscript-formatter-linter = prev.vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "EddieDover";
            name = "gdscript-formatter-linter";
            version = "1.4.5";
            sha256 = "u1qv86ySMCy/DVDb2rYk6Pu6K+eAor+gYoJ1HGK4nic=";
          };
        };
      };
    };
    gnome-keyring = prev.gnome-keyring.overrideAttrs (oldAttrs: {
      mesonFlags = (builtins.filter (flag: flag != "-Dssh-agent=true") oldAttrs.mesonFlags) ++ [
        "-Dssh-agent=false"
      ];
    });
    gnomeExtensions = prev.gnomeExtensions // {
      paperwm = prev.gnomeExtensions.paperwm.overrideAttrs (oldAttrs: {
        version = "latest";
        src = prev.fetchFromGitHub {
          owner = "paperwm";
          repo = "PaperWM";
          rev = "release";
          sha256 = "slJbAEgg4bz681gaiTWp7Vz9QAO+EpgDcWORFyOT3co=";
        };
      });
    };
    ckb-next = prev.ckb-next.overrideAttrs (oldAttrs: rec {
      pname = "ckb-next";
      version = "master";
      src = prev.fetchFromGitHub {
        owner = "ckb-next";
        repo = "ckb-next";
        rev = "master";
        sha256 = "3v4HLzTdnUQGUyzBUzm9IFxj1BEQ2v5JkBbDeHYu2z8=";
      };
      cmakeFlags = [
        "-DINSTALL_DIR_ANIMATIONS=libexec"
        "-DUDEV_RULE_DIRECTORY=lib/udev/rules.d"
        "-DFORCE_INIT_SYSTEM=systemd"
        "-DDISABLE_UPDATER=1"
        "-DUSE_DBUS_MENU=0"
      ];
    });
  };

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.stdenv.hostPlatform.system;
      config.allowUnfree = true;
    };
  };

  affinity-packages = final: _prev: {
    affinity = inputs.affinity.packages.${final.stdenv.hostPlatform.system};
  };
}
