
# Time Complexity - O(v + e) Using BFS, the function checks each vertex through the queue once, and all edges 
# associated with that queue once or twice at most. Checking for non biparition-able graphs via edges beforehand
# and only adding to the queue any edges with vertices that haven't been visited as a vertex prevents
# repeat vertices from being visited. 

# Space Complexity - O(v) - A hash, and set, and a queue are created where the max number of elements added will never exceed
# the number of vertices (v) in the graph. group_hash will always have two keys between which the vertices are divided into based on 
# edges, to_visit is a set of all vertices to delete from (in O(1) time), while bfs at worst will have all vertices in the Queue,
# as the function doesn't add any edges that have already been visited. to_visit mostly exists to track any vertices 
# in a graph that aren't reached by a group of other vertices in the graph, which group_hash and bfs_q can't account for. 
def possible_bipartition(dislikes)
  return true if dislikes.empty?
  
  # at this point will have at least one vertex
  group_hash = {1 => Set.new, 2 => Set.new}
  to_visit = Set.new(0...dislikes.length)
  bfs_q = Queue.new

  # set current group for leading vertex
  v_group = 1

  # set current group for edges
  e_group = 2
  
  # start with first vertex
  group_hash[v_group].add(0)
  to_visit.delete(0)

  dislikes[0].each do |e|
    group_hash[e_group].add(e) unless e == 0 
    bfs_q << e
  end

  until to_visit.empty? 
    until bfs_q.empty?
      # figure out where to put cur_v
      cur_v = bfs_q.pop 
      to_visit.delete(cur_v) # mark visited
  
      if group_hash[e_group].include?(cur_v)
        v_group, e_group = e_group, v_group
      else
        group_hash[v_group].add(cur_v)
      end
      
      dislikes[cur_v].each do |e|
        return false if group_hash[v_group].include?(e) && e != cur_v # account for self cycle
        # at this point there are only edges in e_group or edges that haven't been added
        if !group_hash[e_group].include?(e) # skip and don't queue any that are already checked
          group_hash[e_group].add(e)
          bfs_q << e
        end
        # do nothing if already added 
      end
    end
    
    # bfs ensures that any vertices left in to_visit won't interact with those currently in groups
    # we can just grab the first element in the to_visit set
    if !to_visit.empty?
      bfs_q << to_visit.first # for a general set, we can assume that set pulls any number it wants out, we don't care which one
    end

  end

  return true
end
