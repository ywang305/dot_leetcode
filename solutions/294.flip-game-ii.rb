# @param {String} current_state
# @return {Boolean}
def can_win(current_state, hash = {})
  if current_state.include? '++'
      return hash[current_state] if hash.key? current_state

      can_i_win = [*1..current_state.length].filter_map do |i|
          clone = current_state.clone
          if clone[i-1..i] == '++'
              clone[i-1..i] = '--' 
              clone
          end
      end.any?{ |next_state| !can_win(next_state, hash) }
      hash[current_state] = can_i_win
      return can_i_win
  end

  false
end

# Input: currentState = "++++"
# Output: true
# Explanation: The starting player can guarantee a win by flipping the middle "++" to become "+--+".
