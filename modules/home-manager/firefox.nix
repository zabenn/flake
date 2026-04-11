{ config, pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "Default";
      isDefault = true;
      settings = {
        "browser.download.dir" = config.home.homeDirectory;
        "browser.download.folderList" = 2;
        "browser.download.useDownloadDir" = true;
        "browser.formfill.enable" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.startup.page" = 3;
        "browser.theme.dark-private-windows" = false;
        "browser.uidensity" = 0;
        "extensions.autoDisableScopes" = 0;
        "extensions.enabledScopes" = 15;
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "media.eme.enabled" = true;
        "pref.privacy.disable_button.view_passwords" = true;
        "signon.rememberSignons" = false;
        "svg.context-properties.content.enabled" = true;
      };
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        ublock-origin
      ];
    };
  };
}
