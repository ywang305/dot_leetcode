#
# @lc app=leetcode id=127 lang=ruby
#
# [127] Word Ladder
#

# @lc code=start
# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {Integer}
def ladder_length(begin_word, end_word, word_list)
  word_set = Set.new(word_list)
  return 0 unless word_set.include? end_word

  q = [begin_word]
  step = 0
  until q.empty?
    step += 1
    q.size.times do
      word = q.shift
      return step if word == end_word

      (0...word.length).each do |i|
        ('a'..'z').each do |c|
          new_word = word.dup
          new_word[i] = c
          if word_set.include? new_word
            q << new_word
            word_set.delete new_word
          end
        end
      end
    end
  end
  0
end
# @lc code=end

ladder_length 'hit',
              'cog', %w[hot dot dog lot log cog]
