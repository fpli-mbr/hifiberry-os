# 
# asound.conf for exclusive audio mode
#
defaults.pcm.rate_converter "samplerate"

defaults.pcm.card 0
defaults.ctl.card 0

pcm.hifiberry {
  type hw
  card 0
  device 0
}
pcm.ttable {
 type route
 #ttable_config:stereo 0
 ttable.0.0 1
 ttable.1.1 1
 ttable.0.1 0
 ttable.1.0 0
 slave.pcm "hifiberry"
}
pcm.softvol {
  type softvol
  slave.pcm "ttable"
  control {
    name "Softvol"
    card 0
  }
  min_dB -90.2
  max_dB 0.0
}
ctl.equal {
  type equal;
}
pcm.equal {
  type equal;
  slave.pcm "plug:softvol";
}
pcm.!default { type plug ; slave.pcm "softvol" } # SOFTVOL
