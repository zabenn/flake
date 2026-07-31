{
  lib,
  stdenvNoCC,
  fetchzip,
}:
stdenvNoCC.mkDerivation {
  pname = "yamis-icon-theme";
  version = "1.4.9";

  src = fetchzip {
    url = "https://bitbucket.org/dirn-typo/yet-another-monochrome-icon-set/get/main.tar.gz";
    sha256 = "sha256-lnN+7JIlnn6Gjyf5wKbPj/jkF405oG7GT6Bd3veJLdg=";
    stripRoot = true;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons/yet-another-monochrome-icon-set
    cp -r ./* $out/share/icons/yet-another-monochrome-icon-set/
    runHook postInstall
  '';

  meta = with lib; {
    description = "Yet Another Monochrome Icon Set";
    homepage = "https://store.kde.org/p/2303161";
    license = licenses.gpl3Only;
    platforms = platforms.linux;
  };
}
