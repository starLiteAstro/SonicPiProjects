samps = "Users/Slastro/Documents/Sounds"

live_loop :water do
  sample samps, 5, start: 0.4, finish: 0.5, rate: 2.5, amp: 0.5
  sleep 4
end

with_fx :reverb do
  live_loop :amb do
    sample samps, 4, start: 0.02, finish: 0.04, rate: 0.3, attack: 5, release: 5
    sleep 8
  end
end

with_fx :echo do
  live_loop :amb2 do
    sample samps, 6, start: 0.1, finish: 0.2, rate: 1, attack: 5, release: 5
    sleep 8
  end
end