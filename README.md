# nixos-config

My nixos system and user config. Goal is to keep nixos and home manager configurations for all my hosts in one place. And while I'm at it, I'm trying to deduplicate as much as possible.

## system config

All hosts have their own configuration file and include shared modules later. Start by creating a symlink to the specific host's configuration and hardware configuration files.
After that we're symlinking `/etc/nixos` to the location of our nixos code:

```
$ ln -sf hosts/$(hostname -s)/{hardware-,}configuration.nix nixos/
$ sudo mv /etc/nixos /etc/nixos.bak
```

The next bit could be improved. I'm creating a link to an absolute path and that does not work so well when the nixos installer thumb drive is booted when a system needs to be restored. We might be better off linking `/etc/nixos` to `../home/$USER/nixos-config` but that implies that I know where people clone this project. So the half proper solution it is:

```
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
A few snippets from https://github.com/nix-community/home-manager  on how to install home manager:

```
### setup home manager channel
$ nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
$ nix-channel --update

### install home manager
$ nix-shell '<home-manager>' -A install
```

Verify if home manager is configured as required:

```
$ home-manager edit
```

And is everything is in order, build and install the configuration:

```
$ home-manager switch
```
