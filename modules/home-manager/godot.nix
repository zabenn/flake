{ lib, ... }:
{
   xdg.configFile."godot/editor_settings-4.6.tres".source =
    ../../dotfiles/godot/editor_settings-4.6.tres;
}
