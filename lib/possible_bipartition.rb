#time complexity: O(V+E) V being the number of nodes and E being the number of all edges
#space complexitu: O(V) worst case senario all nodes are pushed to the stack


def possible_bipartition(dislikes)
  # 0 - not visited
  # 1 - group A
  # -1 - group B
  # puppy index - group pair
  puppy_group = Hash.new(0)

  n = dislikes.length - 1
  (0..n).each do |puppy|
    #if puppy not visited, we check it
    if puppy_group[puppy] == 0
      return false unless dfs(dislikes, puppy_group, puppy, 1)
    end
  end

  return true
end

def dfs(dislikes, puppy_group, puppy, group)
  #assgin group and check neighbors
  puppy_group[puppy] = group

  dislikes[puppy].each do |neighbor|
    #return false when there are conflicts
    return false if puppy_group[neighbor] == group
    if puppy_group[neighbor] == 0
      #check neighbor's neighbors as dfs, assign to opposite group
      return false unless dfs(dislikes, puppy_group, neighbor, -group)
    end
  end

  return true
end

