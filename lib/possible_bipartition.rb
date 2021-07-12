# goal - start with first dog, assign it's disliked dogs to opposite groups
# then look at disliked dog's disliked dogs and assign them to groups
# if the disliked dog's disliked dogs groups are already assigned and conflict
# return false
# create an array to store group num for each dog
# create a queue to use to check dog dislikes
# when happen upon current dog, add to visited
# for each current dog, assign it's disliked dogs to a group

# time: O(E + N)?
# space: O(N)
require 'set'

def possible_bipartition(dislikes)

  return true if dislikes.empty?

  group_nums = [1]
  q = Queue.new
  q.enq(0)
  seen_before = Set.new

  while !q.empty?                     
    current_dog = q.deq
    if !seen_before.include?(current_dog)
      seen_before.add(current_dog)
      dislikes[current_dog].each do |disliked_dog|
        if !group_nums[disliked_dog]
          group_nums[disliked_dog] = group_nums[current_dog] == 1 ? 0 : 1
          q.enq(disliked_dog)
        else
          return false if group_nums[disliked_dog] == group_nums[current_dog]
        end
      end
    end
    dislikes[current_dog].empty? ? q.enq(1) : current_dog
  end

  return true
end