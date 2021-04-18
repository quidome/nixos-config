self: super: 
rec {
  gems_2_5.pdk = super.callPackage ./pkgs/gems_2_5/pdk { };
  gems_2_5.puppet5 = super.callPackage ./pkgs/gems_2_5/puppet5 { };
}
