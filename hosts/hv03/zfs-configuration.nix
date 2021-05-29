{ config, ... }:
{
  networking.hostId = "e9869b7e";
  boot.supportedFilesystems = [ "zfs" ];
  boot.loader.grub.devices = [ "/dev/disk/by-id/ata-CT500MX500SSD1_2011E292A245" ];
  boot.kernelParams = ["ip=172.16.10.65::172.16.10.1:255.255.255.0:hv03:enp2s0"];
  boot = {
    initrd.availableKernelModules = [ "e1000e" ];
    initrd.network = {
      # This will use udhcp to get an ip address.
      # Make sure you have added the kernel module for your network driver to `boot.initrd.availableKernelModules`, 
      # so your initrd can load it!
      # Static ip addresses might be configured using the ip argument in kernel command line:
      # https://www.kernel.org/doc/Documentation/filesystems/nfs/nfsroot.txt
      enable = true;

      # ip=<client-ip>:<server-ip>:<gw-ip>:<netmask>:<hostname>:<device>:<autoconf>:
      #    <dns0-ip>:<dns1-ip>:<ntp0-ip>

      ssh = {
        enable = true;
        # To prevent ssh from freaking out because a different host key is used,
        # a different port for dropbear is useful (assuming the same host has also a normal sshd running)
        port = 2222; 

        # check https://search.nixos.org/options?channel=20.09&from=0&size=30&sort=relevance&query=boot.initrd.network.ssh.hostKeys
        # on how to generate hostkeys
        hostKeys = [
          "/etc/secrets/initrd/"
          "/etc/secrets/initrd/ssh_host_ed25519_key"
        ];

        # public ssh key used for login
        authorizedKeys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDt3QtE+Q3VZBAsR13682sf37Neo9afK3lPpwiFvgDouXaR4AXYV/62AvhGCF6W/ZfWbcHwUXuh64cvnnZsZ4b3pwUvVuDiaiPiCueIJJT7Rr8AtrdG35e6uok0CLII1TPlKEPa1x6ec2XFW68wvgtWYT3JbiIxesWIGEfFSKO7aQuaFAXmS0s3YMQzIWaWHSpmA0UXRDNize8sWGoitVpsYNWUUFm7UmgejZkVh1jdkHyoLF+oU99a0wRcZNf3PvaHUDzTbMHFAxt6kLIAoecbBH7yYmFpFEUiVSgTn0wE1IP6ewaIsC1VCuC2dprSWoL9NEuVNIdYLYD8DPNdb8QFlgSfiPs5jKd3fqATpdrskUoBxRMJE22lvf+jOsijeFJl0h6aY2KlggamFDT1VWlHagl0V2VVPxzbGT1sfEuTh8nklhq4u5Mayjah5pa5L8xHKCtjnVaiDJAzy7kLNrYjtqD7owPI4rKM24fQABoPE4dnp/M5HG/0CZ0COZSXxBs= qmeijer@bol.com"
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQb7usZy/3C9LWff68jc7P3pLkOIltQwLbtailkYSaTKa4dycrDsfvPOEM2GNha4XVc/AZp/RB3LIloTQLV2rPPPkylKnopEU75kfl/gCGJi3unQFuhUpSLA1KmTpy31aafCs+Kww7bBcAf1/thkF9Sd9U2ZWER92uxtCAgQfgc5DOHhHSXMnxazyr4nwt4jEgxriJiuTKkHgcgTDyypnTymfRuM1DDWenDsm/DAem9AsspsQreWWPCpXJEJsqmCBiSAwbQIPi8gvcn0x4LUTe7gdZS23uE1Vv+zHdF81MkHy7mrkiyQLBabXQzIjH49TcJu+ytHbPqF+ad+DXaB5qgvvjJzw6O5vmgdSzalMSavMB8lVOlZa1x83DXFPblrsI6+tx4zGyR0XibXk5f0teoKOvzPtwBCnECnNuu57O5ax3waWGx95pKKaWq+8dMPuPbtfvUUK+ycdPvc0XIitFaX5mk+tacaAjPdhjs53MzjDlO/yw0jYRRiBDuv9yJqk= ansible-generated on coolding"
        ];
      };
      # this will automatically load the zfs password prompt on login
      # and kill the other prompt so boot can continue
      postCommands = ''
        echo "zfs load-key -a; killall zfs" >> /root/.profile
      '';
    };
  };
}
