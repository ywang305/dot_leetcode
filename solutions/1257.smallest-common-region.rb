# @param {String[][]} regions
# @param {String} region1
# @param {String} region2
# @return {String}
def find_smallest_region(regions, region1, region2)
  hash = Hash.new{|h,k| h[k]=[] }
  regions.each { |key, *arr| hash[key]=arr }
  search = lambda do |key|
      return key if key == region1 || key==region2

      results = []
      for sub_key in hash[key]
          r = search.call(sub_key)
          results << r if r
      end
      size = results.size
      return results[0] if size==1
      return key if size==2
  end

  search.call(regions.first.first)
end
