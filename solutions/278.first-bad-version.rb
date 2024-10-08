# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
  i = 1
  j = n
  while i <= j
    m = i + (j - i) / 2
    if is_bad_version(m)
      j = m - 1
      found = m
    else
      i = m + 1
    end
  end
  found
end
