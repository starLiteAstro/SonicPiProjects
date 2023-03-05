samps = "Users/Slastro/Documents/Sounds"

live_loop :floot do
  4.times do
    sample samps, "flute.wav", start: 0.1, finish: 0.9, rate: 0.8, amp: 0.5
    sleep 2
  end
  4.times do
    sample samps, "flute.wav", start: 0.1, finish: 0.85, rate: 0.7, amp: 0.5
    sleep 2.1
  end
end

with_fx :reverb do
  live_loop :amb do
    sample "water.wav", start: 0.02, finish: 0.1, rate: 0.6, attack: 5, release: 5
    sleep 8
  end
end

with_fx :echo do
  live_loop :amb2 do
    sample samps, "sunshinesynth.wav", start: 0.1, finish: 0.9, rate: 1, attack: 5, release: 5, amp: 0.4
    sleep 8
  end
end