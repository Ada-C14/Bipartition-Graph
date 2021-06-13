
def possible_bipartition(dislikes)
  visited = {}
dislikes.length.times do |pup|
  q = []
  if !visited[pup]
    q << [pup, "A"]
  end

  while !q.empty?
    current_pup, current_group = q.shift
    if visited[current_pup] && visited[current_pup] != current_group
      return false
    elsif visited[current_pup] && visited[current_pup] == current_group
      next
    end
    # marked current pup as visited
    visited[current_pup] = current_group
    other_group = current_group == "A" ? "B" : "A" 
    dislikes[current_pup].each do |dislike|
      #add all neighbor to the queque
      q << [dislike, other_group]
    end
  end

  end
  return true
end
