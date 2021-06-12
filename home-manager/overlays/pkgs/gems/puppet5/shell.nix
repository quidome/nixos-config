with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "env";
  buildInputs = [
    ruby_2_6.devEnv
    bundix
    #gnumake
    #gcc
  ];
}
