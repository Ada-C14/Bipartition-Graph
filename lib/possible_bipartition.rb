# Time Complexity: O(n x m), where n is the number of puppies, m is the number of enemies
# Space Complexity:

def possible_bipartition(dislikes)
  puppy_enemies = {}

  dislikes.each_with_index do |puppies, index|
    puppy_enemies[index] = puppies
  end

  puppy_groups = {}

  dislikes.length.times do |puppy|
    next if puppy_groups[puppy] # skip if group is already set

    puppy_groups[puppy] = 'RED'

    q = Queue.new
    q.enq(puppy)

    until q.empty?
      current = q.deq

      puppy_enemies[current].each do |enemy|
        if puppy_groups[enemy].nil?
          puppy_groups[enemy] = puppy_groups[current] == 'RED' ? 'BLUE' : 'RED'
          q.enq(enemy)
        elsif puppy_groups[enemy] == puppy_groups[current]
          return false
        end
      end
    end
  end

  return true
end
