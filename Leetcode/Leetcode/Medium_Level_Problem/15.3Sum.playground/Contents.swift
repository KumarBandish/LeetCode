import UIKit

var str = "Hello, playground"
/*
 Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

 Notice that the solution set must not contain duplicate triplets.
 
 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 
 
 Input: nums = []
 Output: []
 
 Input: nums = [0]
 Output: []
 
 solution:
 - if less than 3 elements then return []
    1. sort the array
    2. make a loop & select first element
    3. now use 2 sum pointer approach
    4. check duplication value
 */

//timecomplexity = O(n) + O(nlogn)

func threeSum(_ nums: [Int]) -> [[Int]] {
    var allResults: [[Int]] = []
    if nums.count < 3 {
        return allResults
    }

    let sortedNum = nums.sorted()
   
        
    for i in 0...sortedNum.count - 1 {
        if i > 0, sortedNum[i] == sortedNum[i - 1] { ///check fst 2 continuous value, shouldn't equal
            continue
        }
    
        //now implement 2 sum approach using two pointers technique
        var left = i + 1
        var right = sortedNum.count - 1
        let first = sortedNum[i]
        while left < right {
            let sum = first + sortedNum[left] + sortedNum[right]
            if sum == 0 {
                //checking last two value should not same
                if (left - 1 > i), sortedNum[left] == sortedNum[left - 1] {
                    left += 1
                } else {
                    allResults.append([first, sortedNum[left], sortedNum[right]])
                    left += 1
                }
               
            } else if sum > 0 {
                right -= 1
            } else {
                left += 1
            }
        }
        
    }
    return allResults
}

let nums1 = [-1,0,1,2,-1,-4]

threeSum(nums1) //[[-1, -1, 2], [-1, 0, 1]]
threeSum([0])   //[]
