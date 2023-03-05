songs = "Users/Slastro/Documents/Songs"

in_thread do
  loop do
    sample :drum_heavy_kick
    sleep 1
  end
end

in_thread do
  sleep 0.5
  loop do
    sample :perc_snap
    sleep 1
  end
end

in_thread do
  loop do
    use_synth :fm
    play 40, release: 0.2
    sleep 0.5
  end
end

in_thread(name: :drums) do
  loop do
    sample :elec_snare
    sleep 1
  end
end

live_loop :bad do
  sample songs, "badtothebone.wav", start: 0.0000, finish: 0.02, amp: 1
  sleep 8
end

loop do
  use_synth :zawa
  play 52, attack: 0.7, release: 2.5, amp: 0.02
  sleep 2
end