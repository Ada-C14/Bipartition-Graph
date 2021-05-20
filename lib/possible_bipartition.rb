require 'set'
def possible_bipartition(dislikes)
  return true if dislikes.empty?
  group_a, group_b, blocked_a, blocked_b = Set.new, Set.new, Set.new, Set.new

  # if this index is not included in blocked_a, and go to the index in the adjacency list, and check if its dislikes are in not in group_a
  # check if this index is not included in blocked_b, proceed
    # go to the index and check if its dislikes are not in group_b
  # return false if all four checks failed 
  queue = [ 0 ]
  if dislikes[0].empty?
    queue << 1
  end

  until queue.empty?
    puppy = queue.shift
    if !blocked_a.include?(puppy) && group_a.intersection(dislikes[puppy]).empty?
      # add puppy to group_a 
      group_a << puppy
      # add it's dislikes to blocked_a
      dislikes[puppy].each { |dislike| blocked_a << dislike }
    elsif !blocked_b.include?(puppy) && group_b.intersection(dislikes[puppy]).empty?
      group_b << puppy
      dislikes[puppy].each { |dislike| blocked_b << dislike }
    else
      return false
    end

    # place each of puppy's dislikes into queue if they're not in group_a or group_b
    # if they're in group_a or group_b, it means that node has been visted
    dislikes[puppy].each do |dislike|
      if !(group_a + group_b).include?(dislike)
        queue << dislike
      end
    end
  end

  true

end
