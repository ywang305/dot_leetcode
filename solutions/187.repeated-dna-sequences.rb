# @param {String} s
# @return {String[]}
def find_repeated_dna_sequences(s)
  hash = Hash.new {|h,k| h[k]=0 }
  (0..(s.size-10)).each do |i|
    sub = s[i, 10]
    hash[sub] += 1
  end
  hash.filter{|k,v| v>1}.keys
end
