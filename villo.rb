samps = "Users/Slastro/Documents/Sounds"


load_samples(sample_names :elec)

with_fx :reverb, mix: 0.8 do
  live_loop :foo do
    # try changing the sp_ vars..
    sp_name = choose sample_names :guit
    # sp_name = choose sample_names :drum
    sp_time = 0.5
    #sp_time = 0.5
    sp_rate = 0.7
    
    s = sample sp_name, cutoff: rrand(70, 130), rate: sp_rate * choose([0.5, 1]), pan: rrand(-1, 1), pan_slide: sp_time, amp: 0.2
    control s, pan: rrand(-1, 1)
    sleep sp_time
  end
end

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
  sample :perc_snap,       amp: pat(" 4-4- 414- 4-3-4 4--3- ").look
  sample :elec_blip,       amp: pat(" ---1 -11- 11-1 11-- ").look
  sleep 0.25
end

synth_volume = 1
master = (ramp *range(0, 1, 0.01))