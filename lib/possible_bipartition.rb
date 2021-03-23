
# Time Complexity -
# Space Complexity - 
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
    group_hash[e_group].add(e)
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
      bfs_q << to_visit.first
    end

  end

  return true
end
