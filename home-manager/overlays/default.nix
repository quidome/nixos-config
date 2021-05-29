self: super: 
rec {
  gems.pdk = super.callPackage ./pkgs/gems/pdk { };
  gems.rubocop = super.callPackage ./pkgs/gems/rubocop { };
  gems.puppet5 = super.callPackage ./pkgs/gems/puppet5 { };
}
