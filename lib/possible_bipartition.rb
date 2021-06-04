

def possible_bipartition(dislikes)
  

  dislikes.length.times do |dog|
    p dog
    dog_groups = []
    dog_groups[dog] = 1 #assign 1st dog to a group
    queue = []
    queue << dog

    until queue.empty?
      current = queue.shift #takes 1st element off the queue

      current_group = dog_groups[current]
    
      enemies = dislikes[current]
      #loops through each enemy and check wether it's in the same group as current dog; if so, move it to opposite group
      enemies.each do |enemy|
        if dog_groups[enemy] == nil
          queue << enemy
          if current_group == 1
            dog_groups[enemy] = 2
          else
            dog_groups[enemy] = 1
          end
        #if bipartition is not possible, return false
        elsif dog_groups[enemy] == current_group
          return false
        end
      end
    end
  
  end
  return true
end