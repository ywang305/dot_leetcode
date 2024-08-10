# @param {Integer[][]} clips
# @param {Integer} time
# @return {Integer}
def video_stitching(clips, time)
  clips.sort!{|c1, c2|
      s1,e1 = c1
      s2,e2 = c2
      if s1!=s2 then s1-s2 else e1-e2 end
  }
  step = 0
  cur_time = 0
  next_time = 0
  while clips.size>0 && cur_time < time
      found = false
      while clips.first && clips.first[0]<=cur_time
          s,e = clips.shift
          next_time = max(next_time, e)
          found = true
      end

      return -1 if !found
      step+=1
      cur_time = next_time
  end

  cur_time>=time ? step : -1
end
def max(*vars)=vars.max
