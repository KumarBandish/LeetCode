import UIKit

var str = "Hello, playground"

/*
 Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.

 Return the sum of the three integers.

 You may assume that each input would have exactly one solution.
 ----
 
 Input: nums = [-1,2,1,-4], target = 1
 Output: 2
 Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 
 ----
 
 Input: nums = [0,0,0], target = 1
 Output: 0
 
 */

//1. first make result in this store next 3 values sum
//2. sort the array
//3. iterate over loop
//4. use 2 pointer approach --> left && right pointer
//5. calulate sum of current + low + high pointer
//6. check current_sum with target & update the result
//7. if current_sum greater than target then decrease high else increase low
//8. compare current_sum-target with result - target , which is lower update the result with that

func threeSumClosest(_ nums: [Int], _ target: Int) {
    if nums.count > 2 {
        var result = nums[0] + nums[1] + nums[nums.count - 1]
        
        let sortedNums = nums.sorted()
        
        for i in 0...sortedNums.count - 1 {
            
            var lowPointer = i + 1
            var hightPointer = sortedNums.count - 1
            
            while lowPointer < hightPointer {
                var currentSum = sortedNums[i] + sortedNums[lowPointer] + sortedNums[hightPointer]
                
                if currentSum > target {
                    hightPointer -= 1
                } else {
                    lowPointer += 1
                }
                
                
                if (currentSum - target) > (result - target) {
                    result = currentSum
                }
            }
            
           
        }
        
        print("result is::", result)
    }
    
   
}

let nums = [-1,2,1,-4]
let target = 1
threeSumClosest(nums, target)
