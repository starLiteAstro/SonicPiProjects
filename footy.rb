samps = "Users/Slastro/Documents/Sounds"
roland = "Users/Slastro/Documents/Sounds/Roland TR-808"

use_bpm 120
vol = (line 0, 1, steps: 10).ramp

live_loop :hihat, delay: 0.5 do
  sample :drum_cymbal_closed, rate: 3, amp: 0.3
  sleep [1, 1.5, 2].choose
end

live_loop :bass do
  sample :bd_808, amp: 0.5
  sleep [1, 1.5, 2].choose
end

live_loop :beep, delay: 0.75 do
  sample :elec_blip, rate: 0.8, amp: vol.tick, beat_stretch: 16
  sleep [0.5, 0.25, 0.75, 1].choose
end

live_loop :clap, delay: 4 do
  sample "Users/Slastro/Documents/Sounds/Roland TR-808/SD1000.WAV", amp: 0.4
  sleep [0.25, 0.5, 0.75, 1].choose
end

live_loop :lo, delay: 4.25 do
  sample "Users/Slastro/Documents/Sounds/Roland TR-808/LC25.WAV", amp: 0.4
  sleep [0.25, 0.5, 0.75, 1].choose
end

live_loop :lu, delay: 5 do
  sample "Users/Slastro/Documents/Sounds/Roland TR-808/CP.WAV", amp: 0.4
  sleep [0.25, 0.5, 0.75, 1].choose
end

live_loop :lp, delay: 5.5 do
  sample "Users/Slastro/Documents/Sounds/Roland TR-808/CB.WAV", amp: 0.4
  sleep [0.25, 0.5, 0.75, 1].choose
end

live_loop :cla, delay: 5.75 do
  sample "Users/Slastro/Documents/Sounds/Roland TR-808/LT25.WAV", amp: 0.4
  sleep [0.25, 0.5, 0.75, 1].choose
end

