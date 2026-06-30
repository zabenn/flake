{ config, pkgs, ... }:

let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in
{
  programs = {
    firefox = {
      enable = true;
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never";
        DisplayMenuBar = "default-off";
        SearchBar = "unified";
        SearchEngines = {
          Add = [
            {
              Name = "Amazon";
              URLTemplate = "https://www.amazon.com/s?k={searchTerms}";
              SuggestURLTemplate = "https://completion.amazon.com/api/2017/suggestions?limit=11&prefix={searchTerms}&suggestion-type=KEYWORD&alias=aps&site-variant=desktop&version=3&event=onkeypress";
              IconURL = "https://www.amazon.com/favicon.ico";
              Alias = "amazon";
            }
            {
              Name = "ArtStation";
              URLTemplate = "https://www.artstation.com/search?sort_by=likes&tags_exclude=CreatedWithAI&software_ids_exclude=193982,187754,205467&query={searchTerms}";
              IconURL = "https://www.artstation.com/favicon.ico";
              Alias = "artstation";
            }
            {
              Name = "Etsy";
              URLTemplate = "https://www.etsy.com/search?q={searchTerms}";
              IconURL = "https://www.etsy.com/favicon.ico";
              Alias = "etsy";
            }
            {
              Name = "Nukapedia";
              URLTemplate = "https://fallout.fandom.com/wiki/Special:Search?query={searchTerms}";
              SuggestURLTemplate = "https://fallout.fandom.com/api.php?action=opensearch&format=json&search={searchTerms}";
              IconURL = "https://fallout.fandom.com/favicon.ico";
              Alias = "nukapedia";
            }
            {
              Name = "Google Flights";
              URLTemplate = "https://www.google.com/travel/flights?q={searchTerms}";
              IconURL = "https://www.google.com/favicon.ico";
              Alias = "flights";
            }
            {
              Name = "Google Maps";
              URLTemplate = "https://www.google.com/maps/search/{searchTerms}";
              IconURL = "https://maps.google.com/favicon.ico";
              Alias = "maps";
            }
            {
              Name = "Mana Pool";
              URLTemplate = "https://manapool.com/cards?q={searchTerms}";
              IconURL = "https://manapool.com/favicon.ico";
              Alias = "manapool";
            }
            {
              Name = "MTG Wiki";
              URLTemplate = "https://mtg.wiki/index.php?search={searchTerms}";
              SuggestURLTemplate = "https://mtg.wiki/api.php?action=opensearch&format=json&search={searchTerms}";
              IconURL = "https://mtg.wiki/favicon.ico";
              Alias = "mtgwiki";
            }
            {
              Name = "NixOS Packages";
              URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
              IconURL = "https://search.nixos.org/favicon.png";
              Alias = "nixpkgs";
            }
            {
              Name = "Pinterest";
              URLTemplate = "https://www.pinterest.com/search/pins/?q={searchTerms}";
              IconURL = "https://www.pinterest.com/favicon.ico";
              Alias = "pinterest";
            }
            {
              Name = "Scryfall";
              URLTemplate = "https://scryfall.com/search?q=f:commander+sort:edhrec+{searchTerms}";
              IconURL = "https://scryfall.com/favicon.ico";
              Alias = "scryfall";
            }
            {
              Name = "Wikipedia";
              URLTemplate = "https://en.wikipedia.org/w/index.php?search={searchTerms}";
              SuggestURLTemplate = "https://en.wikipedia.org/w/api.php?action=opensearch&format=json&search={searchTerms}";
              IconURL = "https://en.wikipedia.org/favicon.ico";
              Alias = "wikipedia";
            }
            {
              Name = "YouTube";
              URLTemplate = "https://www.youtube.com/results?search_query={searchTerms}";
              SuggestURLTemplate = "https://suggestqueries.google.com/complete/search?output=firefox&ds=yt&q={searchTerms}";
              IconURL = "https://www.youtube.com/favicon.ico";
              Alias = "youtube";
            }
          ];
          Remove = [
            "Amazon.com"
            "Bing"
            "DuckDuckGo"
            "eBay"
            "Perplexity"
            "Wikipedia (en)"
          ];
        };
        ExtensionSettings = {
          "*".installation_mode = "blocked";
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
            installation_mode = "force_installed";
          };
          "scry-kingdom@zabenn.github.io" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/scrybuy/latest.xpi";
            installation_mode = "force_installed";
          };
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };
        };
        Preferences = {
          "browser.contentblocking.category" = {
            Value = "strict";
            Status = "locked";
          };
          "browser.download.dir" = config.home.homeDirectory;
          "browser.download.folderList" = 2;
          "browser.download.useDownloadDir" = lock-true;
          "browser.formfill.enable" = lock-false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
          "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
          "browser.newtabpage.activity-stream.feeds.topsites" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
          "browser.newtabpage.activity-stream.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
          "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
          "browser.startup.page" = 3;
          "browser.topsites.contile.enabled" = lock-false;
          "browser.uidensity" = 0;
          "extensions.autoDisableScopes" = 0;
          "extensions.enabledScopes" = 15;
          "extensions.formautofill.addresses.enabled" = lock-false;
          "extensions.formautofill.creditCards.enabled" = lock-false;
          "extensions.pocket.enabled" = lock-false;
          "media.eme.enabled" = lock-true;
          "pref.privacy.disable_button.view_passwords" = lock-true;
          "signon.rememberSignons" = lock-false;
          "svg.context-properties.content.enabled" = lock-true;
        };
      };
      profiles.default = {
        id = 0;
        name = "default-release";
        path = "default-release";
        isDefault = true;
      };
    };
  };
}
