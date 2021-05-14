
def possible_bipartition(dislikes)
  dog_group1 = []
  dog_group2 = []

  dislikes.each_with_index do |enemies, dog|
    safe1 = true
    safe2 = true
    enemies.each do |enemy|
      if dog_group1.include?(enemy)
        safe1 = false
      elsif dog_group2.include?(enemy)
        safe2 = false
      end
    end
      
    if safe1
      dog_group1 << dog
      #dog_group2 << enemy
    elsif safe2
      dog_group2 << dog
    else
      return false
    end
  end
  return true
end



#breadth first solution