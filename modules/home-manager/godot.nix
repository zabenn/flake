{ lib, ... }:
{
  home.activation.godotEditorSettingsWritable = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    [ -f ~/.config/godot/editor_settings-4.6.tres ] && cp ~/.config/godot/editor_settings-4.6.tres ~/.config/godot/editor_settings-4.6.tres.backup
    rm -f ~/.config/godot/editor_settings-4.6.tres
    cp --no-preserve=mode ${../../dotfiles/godot/editor_settings-4.6.tres} ~/.config/godot/editor_settings-4.6.tres
  '';
}
