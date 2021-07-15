# nixos-config

My nixos system and user config. Goal is to keep nixos and home manager configurations for all my hosts in one place. And while I'm at it, I'm trying to deduplicate as much as possible.

I'm cloning this repo to /q and link to it.

## system config

All hosts have their own configuration file and include shared modules later. We're linking a specific hosts configuration file into /etc/nixos. That configuration file will use relative paths to include all required config.


```
$ sudo ln -sf /q/hosts/$(hostname -s)/configuration.nix /etc/nixos/configuration.nix
```

## home manager

This part is in progress. The goal is to have nixos include home-manager config for my main user. Till then ...

First link to host specific config file and then link the entire dir to .config/nixpkgs:

```
$ ln -s /q/home-manager/hosts/$(hostname -s)/home.nix /q/home-manager/
$ ln -s /q/home-manager ~/.config/nixpkgs
```

### home manager quick install

I'm installing and managing home manager from within home manager.
A few snippets from https://github.com/nix-community/home-manager  on how to install home manager:

```
### setup home manager channel under root (why keep two channel lists)
$ sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-21.05.tar.gz home-manager
$ sudo nix-channel --update

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
