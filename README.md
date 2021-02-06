# nixos-config
My nixos system and user config

## system config

All hosts have their own configuration file and include shared modules later. Start by creating a symlink to the specific host's configuration and hardware configuration files.
After that we're symlinking /etc/nixos to the location of our nixos code.
```
$ ln -sf hosts/$(hostname -s)/{hardware-,}configuration.nix nixos/
$ sudo mv /etc/nixos /etc/nixos.bak
$ sudo ln -s $(pwd)/nixos/ /etc/nixos
```

## home manager

For home manager I'm doing the same thing. First link to host specific config file and then link the entire dir to .config/nixpkgs:

```
$ ln -s hosts/$(hostname -s)/home.nix nixpkgs/
$ ln -s $(pwd)/nixpkgs ~/.config/nixpkgs
```

### home manager quick install

I'm installing and managing home manager from within home manager.
A few snippets from https://github.com/nix-community/home-manager , on how to install home manager:

```
### setup home manager channel
$ nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
$ nix-channel --update

### install home manager
$ nix-shell '<home-manager>' -A install
```
