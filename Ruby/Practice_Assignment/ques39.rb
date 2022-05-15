# 39. Given two unsorted arrays A of size N and B of size M of distinct elements, the task is to find all pairs from
# both arrays whose sum is equal to X.
class Target_sum
  def self.sum_target(array_a, array_b, target)
    hash = Hash.new
    (0...array_b.size).each {|index| hash[array_b[index]] = index}
    (0...array_a.size).each {|index| 
      if hash[target - array_a[index]]
        print "[",array_a[index], ",",target - array_a[index],"]" 
      end
    }
  end
end
