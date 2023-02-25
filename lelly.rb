songs = "Users/Slastro/Documents/Songs"
samps = "Users/Slastro/Documents/Sounds"

use_bpm 93

live_loop :piano, sync, :foo do
  with_fx :distortion, mix: 0.6 do
    sample songs, 1, start: 0.0001, finish: 0.052, rate: 1, amp: 0.5, beat_stretch: 316
    sleep 16
  end
end

live_loop :drums, sync, :foo2 do
  sample :loop_safari, rate: 1, beat_stretch: 16, amp: 0.5
  sleep 4
end

#live_loop :drum, sync, :foo3 do
#  sample :loop_breakbeat, rate: 1, beat_stretch: 4
#  sleep 4
#end