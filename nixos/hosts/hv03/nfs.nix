{ config, ... }:
{
  fileSystems."/srv/docker" = {
    device = "hv01.lan.balti.casa:/srv/docker";
    fsType = "nfs";
  };
  fileSystems."/media/audio" = {
    device = "hv01.lan.balti.casa:/media/audio";
    fsType = "nfs";
  };
  fileSystems."/media/movies" = {
    device = "hv01.lan.balti.casa:/media/movies";
    fsType = "nfs";
  };
  fileSystems."/media/tvshows" = {
    device = "hv01.lan.balti.casa:/media/tvshows";
    fsType = "nfs";
  };
  fileSystems."/media/video" = {
    device = "hv01.lan.balti.casa:/media/video";
    fsType = "nfs";
  };
}
