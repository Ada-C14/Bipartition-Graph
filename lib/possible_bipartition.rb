
def possible_bipartition(dislikes)
  visited = {}
  q1 = []
  hash1 = {}
  q2 = []
  hash2 = {}
  
  i = 0
  
  while i < dislikes.length
    if dislikes[i] != [] && !visited[i]
      q1 << i
      hash1[i] = true
      while q1.length > 0 || q2.length > 0
        return false if !bfs(q1, q2, hash1, hash2, visited, dislikes)
        return false if !bfs(q2, q1, hash2, hash1, visited, dislikes)
      end
    end
    i += 1
  end
  return true
end

def bfs(q1, q2, hash1, hash2, visited, dislikes)
  while q1.length > 0
    dog1 = q1.shift
    visited[dog1] = true
    dislikes[dog1].each do |dog|
      if hash1[dog]
        return false
      else
        if !visited[dog]
          hash2[dog] = true
          q2 << dog
        end
      end
    end
  end
  return true
end
