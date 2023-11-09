
# @param {Integer[]} pref
# @return {Integer[]}
def find_array(pref)
  pref.map.with_index do |c, i|
    next c if i.zero?
    c ^ pref[i-1]
  end
end
