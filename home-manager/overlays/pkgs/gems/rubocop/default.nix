{ lib, bundlerApp, bundlerUpdateScript }:

bundlerApp {
  pname = "rubocop";
  gemdir = ./.;
  exes = [ "rubocop" ];

  passthru.updateScript = bundlerUpdateScript "";

}
