{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "browser-chooser";
  version = "0.1.0-dev";
  src = ./src;
  phases = "installPhase fixupPhase";
  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/applications
    cp ${src}/browser-chooser $out/bin/
    cp ${src}/browser-chooser.desktop $out/share/applications/
    chmod +x $out/bin/browser-chooser
  '';
}
