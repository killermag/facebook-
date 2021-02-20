require 'pry-byebug'
def judge_point24(nums, list=24)
  if nums.length == 2 
    return true if perform_arithmetic(nums[0], list).include? nums[1]
    return false 
  else 
    # [1,2,3,4]
    # [3,3,4]
    nums.each_with_index do |main_value, main_index| 
      without_main_value = copy(nums, main_index)
      return true if judge_point24(without_main_value, perform_arithmetic(main_value, list)) == true 
      without_main_value.each_with_index do |child_value, child_index| 
        subchild_array = copy(without_main_value, child_index)
        if judge_point24([main_value + child_value] + subchild_array) == true 
          puts "a: true"
          return true
        elsif judge_point24([main_value - child_value] + subchild_array) == true 
          puts "b: true"
          return true
        elsif judge_point24([main_value * child_value] + subchild_array) == true 
          puts "c: true"
          return true
        elsif child_value != 0 && judge_point24([main_value / child_value] + subchild_array) == true 
          puts "d: true"
          return true
        end 
      end 
    end 
    return false 
  end  
end 



















def copy(array, index)
  new_array = array.clone
  new_array.delete_at index 
  new_array 
end 

def perform_arithmetic(num, goal)
  result = []
  if goal.is_a? Array 
    goal.each do |n| 
      if num == n 
        result << 0 
      elsif num < n 
        result << n - num 
      else 
        result << num - n
      end 
        
        unless num == 0 || n == 0 
          result << n/num.to_f 
          result << num/n.to_f
        end 
 
    end 
  else 
    if num == goal 
      result << 0 
    elsif num < goal 
      result << goal - num 
    else 
      result << num - goal
    end 

      unless num == 0 || goal == 0
        result << goal/num.to_f 
        result << num/goal.to_f
      end 

  end 
  result 
end 


binding.pry
puts judge_point24([4,1,8,7])
