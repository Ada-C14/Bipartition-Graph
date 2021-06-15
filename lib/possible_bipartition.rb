
# Time complexity: O(V + E), where V is the number of vertices and E is the number of adjecent neighbors. 
# Space complexity: O(V) where v is the number of vertices/dogs because of the dog_group array. The recursive stack will be at most O(n), as well. 
def possible_bipartition(dislikes)
  # 0 is no color
  # 1 is one color
  # -1 is the other


  # keep track of the colors
  # if a color exists for one, we return false?
  dog_group = Array.new(dislikes.length, 0)
  p dislikes
  dislikes.length.times do |dog|
    if dog_group[dog] == 0 && !dfs(dislikes, dog_group, dog, 1)
      return false
    end
  end
  return true
end

def dfs(dislikes, dog_group, current_dog, group)

  dog_group[current_dog] = group

  dislikes[current_dog].each do |disliked_dog|
    if dog_group[disliked_dog] == group
      return false
    end

    if dog_group[disliked_dog] == 0 && !dfs(dislikes, dog_group, disliked_dog, group * -1)
      return false
    end
  end
  return true
end
