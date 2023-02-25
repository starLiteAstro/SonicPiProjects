samps = "Users/Slastro/Documents/Sounds"


live_loop :foo do
  sample :loop_garzul, pitch: 0.3
  sample :ambi_choir, rate: 0.2, sustain: 4
  use_synth :prophet
  play :c1, release: 8, cutoff: rrand(70, 130), amp: 0.2
  sleep 8
end

live_loop :bar do
  sample :bd_haus
  sleep 0.5
end

4.times do
  live_loop :kick, do
    sync :bar
    sample :drum_snare_soft
    sleep 0.5
  end