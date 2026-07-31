{
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.dms.homeModules.niri
  ];
  programs = {
    dank-material-shell.niri = {
      enableKeybinds = true;
      enableSpawn = true;
      includes.enable = false;
    };

    niri.settings = {
      prefer-no-csd = true;

      environment = {
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORMTHEME = "qt6ct";
        QT_QPA_PLATFORMTHEME_QT6 = "qt6ct";
      };

      input.touchpad = {
        tap = true;
        click-method = "clickfinger";
      };

      outputs."eDP-1" = {
        scale = 1.25;
      };

      layout = {
        always-center-single-column = true;
        center-focused-column = "on-overflow";

        preset-column-widths = [
          { proportion = 0.35; }
          { proportion = 0.65; }
          { proportion = 1.0; }
        ];
        default-column-width = {
          proportion = 0.35;
        };
      };

      gestures.hot-corners.enable = false;

      overview.zoom = 1.0;
      binds = with config.lib.niri.actions; {
        "Mod+Shift+Slash" = {
          action = show-hotkey-overlay;
        };

        "Mod+T" = {
          action = spawn "ghostty";
        };
        "Mod+Q" = {
          action = close-window;
        };

        "Mod+Left" = {
          action = focus-column-left;
        };
        "Mod+Down" = {
          action = focus-window-down;
        };
        "Mod+Up" = {
          action = focus-window-up;
        };
        "Mod+Right" = {
          action = focus-column-right;
        };
        "Mod+Home" = {
          action = focus-column-first;
        };
        "Mod+End" = {
          action = focus-column-last;
        };

        "Mod+Ctrl+Left" = {
          action = move-column-left;
        };
        "Mod+Ctrl+Down" = {
          action = move-window-down;
        };
        "Mod+Ctrl+Up" = {
          action = move-window-up;
        };
        "Mod+Ctrl+Right" = {
          action = move-column-right;
        };
        "Mod+Ctrl+Home" = {
          action = move-column-to-first;
        };
        "Mod+Ctrl+End" = {
          action = move-column-to-last;
        };

        "Mod+R" = {
          action = switch-preset-column-width;
        };
        "Mod+F" = {
          action = fullscreen-window;
        };

        "Mod+Tab" = {
          action = toggle-overview;
        };
      };
    };
  };
}
