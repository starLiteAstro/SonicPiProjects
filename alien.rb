def pat(p)
  p.delete(' ').split('').map{ |v|  v.to_f / 10  }.ring
end

live_loop :machine do
  use_bpm 120
  tick
  sample :bd_haus,          amp: pat(" -4-- -4-- -4-- -4-- ").look
  sample :drum_cymbal_pedal, amp: pat(" --7- --9- --7- --9- ").look
  sample :drum_heavy_kick, amp: pat(" 9--- 6--- 9--- 6--- ").look
  sample :elec_flip,       amp: pat(" 5535 2443 1122 1423 ").look
  sample :elec_beep,       amp: pat(" ---- ---1 ---1 1--- ").look
  sample :elec_blup,       amp: pat(" -1-- ---1 ---1 --1- ").look
  sample :elec_blip,       amp: pat(" --11 -11- 11-1 11-- ").look
  sleep 0.25
end

use_debug false
use_cue_logging false

#set :rootNote, 30
defonce :setRootNoteStart do
  set :rootNote, 30
end

setRootNoteStart()

live_loop :rootSetter do
  tick
  if get(:rootNote) > 130
    set :rootNote, 30
    tick_reset
  else
    set :rootNote, get(:rootNote) + look
  end
  sleep 4
end

define :getNotes do | var, x |
  tempArray = []
  x.times do
    tempArray.append(get(:rootNote) + rand(var))
  end
  return tempArray
end

define :getSleeps do | x |
  sls = []
  x.times do
    sls.append([0.125, 0.25, 0.5, 0.75, 1, 2].sample)
  end
  return sls
end

live_loop :s1 do
  tick
  if tick > 100
    tick_reset
  end
  use_synth :piano
  with_fx :reverb, damp: range(0, 0.5, 0.05).mirror.look, room: range(0.1, 0.9, 0.05).mirror.look do
    play_pattern_timed getNotes(rand(5)+1, 5), getSleeps(4), amp: range(0.2, 0.4, 0.01).ramp.look
  end
end

live_loop :s2 do
  tick
  use_synth :fm
  with_fx :distortion, distort: range(0.1, 0.5, 0.01).mirror.look, mix: range(0.1, 0.3, 0.03).mirror.look do
    with_fx :hpf, cutoff: range(0.1, 100, 0.5).mirror.look, mix: 0.8 do
      
      play_pattern_timed getNotes(3, 7), getSleeps(5), amp: range(0, 0.5, 0.01).mirror.look
    end
  end
end