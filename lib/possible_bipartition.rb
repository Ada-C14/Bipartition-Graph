
def possible_bipartition(dislikes)
  return true if dislikes.empty? 

  group_num = Array.new(dislikes.length)
  # Element at index i indicates group number for dog i
  group_num[0] = 1
  queue = Queue.new
  queue.enq(0)
  while !queue.empty?
    current = queue.deq
    dislikes[current].each do |dog|
      if group_num[dog].nil?
        # Assign dogs disliked by the current dog to the other group
        group_num[dog] = group_num[current] == 1 ? 2 : 1
        queue.enq(dog)
      # If a dog disliked by the current dog is in the same group
      elsif group_num[dog] == group_num[current]
        return false
      end
    end
    queue.enq(current + 1) if dislikes[current].empty?
  end

  return true
end
