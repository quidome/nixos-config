{ lib, bundlerApp, bundlerUpdateScript }:

bundlerApp {
  pname = "puppet";
  gemdir = ./.;
  #exes = [ "puppet" "puppet-lint" "pdk" "rspec" ];
  exes = [ "puppet" "puppet-lint" "hiera" "facter" "rubocop" "rspec" ];

  passthru.updateScript = bundlerUpdateScript "";

}
