samps = "/Users/Slastro/Documents/Sounds"








def pat(p)
  p.delete(' ').split('').map{ |v|  v.to_f / 10  }.ring
end


live_loop :machine do
  use_bpm 120
  tick
  sample :bd_haus,          amp: pat(" -4-- -4-- -4-- -4-- ").look
  sample :drum_cymbal_pedal, amp: pat(" --7- --7- --7- --7- ").look
  sample :drum_heavy_kick, amp: pat(" 6--- 6--- 6--- 6--- ").look
  sample :elec_flip,       amp: pat(" 5535 2443 1122 1423 ").look
  sample :elec_beep,       amp: pat(" ---- ---1 ---1 1--- ").look
  sample :elec_blup,       amp: pat(" -1-- ---1 ---1 --1- ").look
  sample :elec_blip,       amp: pat(" --11 -11- 11-1 11-- ").look
  sleep 0.25
end

use_debug false
use_cue_logging false


live_loop :water do
  sample "/Users/Slastro/Documents/Sounds/5. 339324__inspectorj__stream-water-c.wav", start: 0.1, finish: 0.15, amp: 1.2, pitch: 0.5
  sleep 5
end

live_loop :geetar do
  use_synth :pluck
  play rrand_i(40, 80), amp: 0.3
  sleep [0.1, 0.15, 0.18, 0.2, 2].choose
end






