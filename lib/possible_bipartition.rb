# Time complexity: O(N + E) for BFS * O(N) for each node - O(N^2)?
# Space complexity: O(N) for dog_groups and queue
def possible_bipartition(dislikes)
  # The goal is to find out if it is possible to put the dogs into two groups
  # We are going to denote these as 1 & -1, with 0 as "unvisited"
  # We are going to do BFS starting from each vertices

  size = dislikes.length
  dog_groups = Hash.new(0) # hash of dog groups
  queue = Queue.new
  size.times do |node|
    # If we haven't put this dog in a group yet
    if dog_groups[node].zero?
      dog_groups[node] = 1 # Start with group 1
      queue << node # Put the node into the BFS queue

      # Process the queue
      until queue.empty?
        neighbor = queue.pop
        this_group = dog_groups[neighbor] # Group that the parent belongs to

        dislikes[neighbor].each do |node| # Traverse all the children
          # Visit each connected node and assign to opposite group
          if dog_groups[node].zero? # Node has not been visited
            dog_groups[node] = this_group * -1 # Assign opposite group and add to queue
            queue << node
          elsif dog_groups[node] == this_group
            return false # We have an existing connection in the same group - bipartition not possible
          end
        end

      end

    end
  end

  # If we're here - we have sorted the dogs into two groups!
  return true

end
