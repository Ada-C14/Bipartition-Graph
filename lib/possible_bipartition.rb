
def possible_bipartition(dislikes)
  dislikes.length.times do |dog|
    groups = []
    groups[dog] = 1
    queue = []
    queue << dog

    until queue.empty?
      current = queue.shift
      current_group = groups[current]
      enemies = dislikes[current]

      enemies.each do |enemy|
        if groups[enemy] == nil
          queue << enemy
          if current_group == 1
            groups[enemy] = 2
          else
            groups[enemy] = 1
          end
        elsif groups[enemy] == current_group
          return false
        end
      end
    end
  end
  return true
end
