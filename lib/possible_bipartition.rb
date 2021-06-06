# DFS
def possible_bipartition(dislikes)
  marked = {}
  groups = {}
  is_bipartition = []

  index = 0
  while marked.length < dislikes.length && index < dislikes.length
    if !marked[index]
      marked[index] = true
      groups[index] = "A"
      is_bipartition, marked, groups = dfs_helper(dislikes, index, marked, groups, is_bipartition) 
      if !is_bipartition.empty?
        return false
      end
    end
    index += 1
  end
  return true
end

def dfs_helper(graph, index, marked, groups, bipartition)
  graph[index].each do |node|
    if !marked[node]
      marked[node] = true
      groups[node] = (groups[index] == "A" ? "B" : "A")
      dfs_helper(graph, node, marked, groups, bipartition)
    else
      if groups[index] == groups[node]
        return bipartition.push(false), marked, groups
      end
    end
  end
  return bipartition, marked, groups
end
