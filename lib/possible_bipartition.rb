# Time complexity: in a breadth first search, each node (N) must be visited
# and each edge (E) must be checked, so the time involved is O(N+E)
# Space complexity: in the worst case scenario, q will contain every node
# in dislikes, so space is O(N)

def possible_bipartition(dislikes)
  q = Queue.new
  visited = Array.new(dislikes.length, false)
  group = Array.new(dislikes.length)
  i = 0

  while visited.include?(false)
    group[i] = 1
    visited[i] = 1
    q.push(i)

    until q.empty?
      current = q.pop()
      dislikes[current].each do |dog|
        if visited[dog]
          if group[dog] == group[current]
            return false
          end
        else
          q.push(dog)
          visited[dog] = true
          group[dog] = -group[current]
        end
      end
    end
    i = visited.index(false)
  end

  return true
end