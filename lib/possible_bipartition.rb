
def possible_bipartition(dislikes)
  return true if dislikes.empty? 

  group_num = Array.new(dislikes.length)
  group_num[0] = 1
  queue = Queue.new
  queue.enq(0)
  while !queue.empty?
    current = queue.deq
    dislikes[current].each do |dog|
      if group_num[dog].nil?
        group_num[dog] = group_num[current] == 1 ? 2 : 1
        queue.enq(dog)
      elsif group_num[dog] == group_num[current]
        return false
      end
    end
    queue.enq(current + 1) unless current == dislikes.length - 1
  end

  return true
end
