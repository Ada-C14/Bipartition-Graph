# PSEUDOCODE
# BFS --> queue
# Groupings array for each dog (size of input array) --> can be 0 or 1 (since bipartition)
# >> rule will be current_grouping = 1 - current_grouping
# If a dog / node hasn't been encountered yet (grouping of -1), then add to queue and set grouping
# If a node grouping ever violates (same as the current node's grouping), then return false

# Time Complexity: O(N+E) -- visit every single node and every one of its edges
# >> Outer loop: O(n) where n is size of input array
# >> Inner loop: O(e) where e is the number of edges
# Space Complexity: O(N)
# >> Queue depends on size of input array
# >> groupings array will be size of input array

def possible_bipartition(dislikes)
  return true if dislikes.empty?

  dog_queue = Queue.new
  dog_queue << 0
  dog_groupings = [-1] * dislikes.size
  current_grouping = 0

  until dog_queue.empty?
    current_dog = dog_queue.pop
    if dog_groupings[current_dog] == -1
      dog_groupings[current_dog] = 1 - current_grouping
      current_grouping = 1 - current_grouping
    else
      current_grouping = dog_groupings[current_dog]
    end

    disliked_dogs = dislikes[current_dog]
    disliked_dogs&.each do |dog|
      return false if dog_groupings[dog] == current_grouping

      if dog_groupings[dog] == -1
        dog_groupings[dog] = 1 - current_grouping
        dog_queue << dog
      end
    end

    dog_queue << current_dog + 1 if current_dog + 1 < dislikes.size && dog_queue.empty?
  end

  return true
end

