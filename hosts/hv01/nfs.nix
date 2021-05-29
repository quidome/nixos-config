{ config, ... }:
{
  # nfs shares
  services.nfs.server = {
    enable = true;
    exports = ''
    /srv/docker    172.16.10.65(rw,nohide,insecure,no_subtree_check) 172.16.40.65(rw,nohide,insecure,no_subtree_check)
    /media/audio   172.16.10.65(rw,nohide,insecure,no_subtree_check) 172.16.40.65(rw,nohide,insecure,no_subtree_check)
    /media/movies  172.16.10.65(rw,nohide,insecure,no_subtree_check) 172.16.40.65(rw,nohide,insecure,no_subtree_check)
    /media/print   172.16.10.65(rw,nohide,insecure,no_subtree_check) 172.16.40.65(rw,nohide,insecure,no_subtree_check)
    /media/tvshows 172.16.10.65(rw,nohide,insecure,no_subtree_check) 172.16.40.65(rw,nohide,insecure,no_subtree_check)
    /media/video   172.16.10.65(rw,nohide,insecure,no_subtree_check) 172.16.40.65(rw,nohide,insecure,no_subtree_check)
    '';
  };
}
