{ lib, ... }:
{
  xdg.configFile."godot/editor_settings-4.7.tres".source =
    ../../dotfiles/godot/editor_settings-4.7.tres;
}
