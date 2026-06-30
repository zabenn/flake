{ inputs, ... }:
{
  additions = final: _prev: import ../pkgs final.pkgs;

  modifications = final: prev: {
    gnome-keyring = prev.gnome-keyring.overrideAttrs (oldAttrs: {
      mesonFlags = (builtins.filter (flag: flag != "-Dssh-agent=true") oldAttrs.mesonFlags) ++ [
        "-Dssh-agent=false"
      ];
    });
    vscode-extensions = prev.lib.recursiveUpdate prev.vscode-extensions {
      eddiedover."gdscript-formatter-linter" = prev.vscode-utils.buildVscodeMarketplaceExtension {
        mktplcRef = {
          publisher = "EddieDover";
          name = "gdscript-formatter-linter";
          version = "1.4.5";
          sha256 = "u1qv86ySMCy/DVDb2rYk6Pu6K+eAor+gYoJ1HGK4nic=";
        };
      };
    };
  };

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.stdenv.hostPlatform.system;
      config.allowUnfree = true;
    };
  };
}
