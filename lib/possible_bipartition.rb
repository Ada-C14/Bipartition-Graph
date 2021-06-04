# Given a set of N puppies (numbered 0, 1, 2, ..., N - 1), 
# we would like to split them into two groups of any size to use two play areas.

# Some dogs have a history of fighting with specific other dogs 
# and shouldn't be put into the same play area.

# Formally, if dislikes[i] = [a, b], it means dog i is not allowed to put in the same group as dog a or dog b.

# Return true if and only if it is possible to split the dogs into two groups where no fighting will occur.

# Example 1
# Input: dislikes = [ [],
#                     [2, 3],
#                     [1, 4],
#                     [1],
#                     [2]
#                   ]
# Output: true
# Explanation: group1 [0, 1, 4], group2 [2, 3]

# Note
# The graph is undirected, so if dog 1 dislikes dog 2, then dog 2 also dislikes dog 1.

# BFS solution
def possible_bipartition(dislikes)
  return true if dislikes.empty?
  first_dog = 0
  visited = {} # key is dog index and value is group number

  queue = Queue.new()
  queue.push(0)
  visited[first_dog] = 1

  while !queue.empty?
    current_dog = queue.pop
    
    bad_neighbors = dislikes[current_dog]

    # if dog does not dislike other dogs, add next, unvisited dog in list to queue
    if bad_neighbors.empty?
      next_dog = current_dog + 1

      while visited[next_dog]
        next_dog += 1
      end

      queue.push(next_dog)
      visited[next_dog] = 1
    end

    bad_neighbors.each do |bad_neighbor|
      # if current dog and dog it dislikes has been visited and put into the same group, return false
      if visited[current_dog] && visited[bad_neighbor] && visited[current_dog] == visited[bad_neighbor]
        return false
      end

      # if dog hasn't been visited, add to stack to check it's neighbors
      if !visited[bad_neighbor]
        queue.push(bad_neighbor)
        # put disliked dog in opposite group
        group_to_place_neighbor = visited[current_dog] == 1 ? 2 : 1
        visited[bad_neighbor] = group_to_place_neighbor
      end
    end
  end

  return true
end
