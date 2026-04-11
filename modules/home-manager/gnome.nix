{
  config,
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}:
{
  systemd.user.services.remove-gnome-app-folders = {
    Unit = {
      After = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.dconf}/bin/dconf write /org/gnome/desktop/app-folders/folder-children \"@as []\"";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  xdg.configFile."monitors.xml".source =
    ../../dotfiles/monitors + "/${osConfig.networking.hostName}.xml";

  dconf = {
    enable = true;
    settings = {
      "com/ftpix/transparentbar" = {
        dark-full-screen = false;
        transparency = 0;
      };
      "org/gnome/desktop/app-folders" = {
        folder-children = [ ];
      };
      "org/gnome/desktop/app-folders/folders/Pardus" = {
        apps = [ ];
        categories = [ ];
        name = "";
      };
      "org/gnome/desktop/app-folders/folders/System" = {
        apps = [ ];
        categories = [ ];
        name = "";
      };
      "org/gnome/desktop/app-folders/folders/Utilities" = {
        apps = [ ];
        categories = [ ];
        name = "";
      };
      "org/gnome/desktop/app-folders/folders/YaST" = {
        apps = [ ];
        categories = [ ];
        name = "";
      };
      "org/gnome/desktop/background" = {
        picture-uri-dark = "file://" + toString ../../dotfiles/gnome/wallpaper.png;
      };
      "org/gnome/desktop/interface" = {
        accent-color = "blue";
        clock-format = "12h";
        color-scheme = "prefer-dark";
        clock-show-weekday = true;
        enable-hot-corners = false;
        gtk-theme = "Adwaita-dark";
      };
      "org/gnome/desktop/search-providers" = {
        disabled = [ ];
        sort-order = [
          "org.gnome.Weather.desktop"
          "org.gnome.Epiphany.desktop"
          "org.gnome.Calculator.desktop"
          "org.gnome.seahorse.Application.desktop"
          "org.gnome.clocks.desktop"
          "org.gnome.Nautilus.desktop"
          "org.gnome.Settings.desktop"
          "org.gnome.Characters.desktop"
          "org.gnome.Contacts.desktop"
          "org.gnome.Calendar.desktop"
        ];
      };
      "org/gnome/desktop/wm/preferences" = {
        num-workspaces = 1;
      };
      "org/gnome/gnome-screenshot" = {
        auto-save-directory = "file://${config.home.homeDirectory}";
      };
      "org/gnome/mutter" = {
        dynamic-workspaces = false;
        experimental-features = [
          "scale-monitor-framebuffer"
        ];
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          pkgs.gnomeExtensions.paperwm.extensionUuid
          pkgs.gnomeExtensions.transparent-top-bar-adjustable-transparency.extensionUuid
          pkgs.gnomeExtensions.vertical-workspaces.extensionUuid
          pkgs.gnomeExtensions.vscode-search-provider.extensionUuid
        ];
      };
      "org/gnome/shell/extensions/paperwm" = {
        cycle-height-steps = [
          0.5
          1.0
        ];
        cycle-width-steps = [
          0.35
          0.65
        ];
        default-focus-mode = 0;
        gesture-workspace-fingers = 0;
        horizontal-margin = 30;
        maximize-width-percent = 0.95;
        overview-min-windows-per-row = 4;
        selection-border-size = 0;
        show-focus-mode-icon = false;
        show-open-position-icon = false;
        show-window-position-bar = false;
        show-workspace-indicator = false;
        vertical-margin = 0;
        vertical-margin-bottom = 30;
        window-gap = 30;
        winprops = [
          ''{"wm_class":"*","preferredWidth":"35%"}''
          ''{"wm_class":"affinity.exe","preferredWidth":"65%"}''
          ''{"wm_class":"blender","preferredWidth":"65%"}''
          ''{"wm_class":"Code","preferredWidth":"65%"}''
          ''{"wm_class":"designer.exe","preferredWidth":"65%"}''
          ''{"wm_class":"discord","preferredWidth":"65%"}''
          ''{"wm_class":"firefox","title":"/^Mozilla Firefox$/","preferredWidth":"65%"}''
          ''{"wm_class":"Godot","preferredWidth":"65%"}''
          ''{"wm_class":"Nxplayer.bin","preferredWidth":"65%"}''
          ''{"wm_class":"rviz2","preferredWidth":"65%"}''
          ''{"wm_class":"steam","title":"/^Steam$/","preferredWidth":"65%"}''
        ];
      };
      "org/gnome/shell/extensions/vertical-workspaces" = {
        app-grid-animation = 3;
        app-grid-bg-blur-sigma = 0;
        app-grid-order = 4;
        app-grid-page-width-scale = 70;
        click-empty-close = true;
        dash-position = 4;
        enable-page-shortcuts = false;
        highlighting-style = 2;
        notification-position = 1;
        overview-bg-blur-sigma = 0;
        overview-mode = 0;
        search-app-grid-mode = 0;
        search-bg-brightness = 60;
        search-fuzzy = true;
        search-include-settings = false;
        search-width-scale = 80;
        show-overview-background = 2;
        show-ws-preview-bg = false;
        startup-state = 2;
        swipe-tracker-module = false;
        workspace-animation = 0;
        ws-thumbnails-position = 4;
      };
    };
  };

  xdg.desktopEntries = {
    "nixos-manual" = {
      name = "";
      noDisplay = true;
    };
    "nvidia-settings" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Calculator" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.clocks" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Decibels" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Epiphany" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Evince" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Geary" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Logs" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Loupe" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Maps" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.seahorse.Application" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Snapshot" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.TextEditor" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Totem" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Tour" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Weather" = {
      name = "";
      noDisplay = true;
    };
    "simple-scan" = {
      name = "";
      noDisplay = true;
    };
    "xterm" = {
      name = "";
      noDisplay = true;
    };
    "yelp" = {
      name = "";
      noDisplay = true;
    };
  };
}
