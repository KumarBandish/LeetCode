import UIKit

var greeting = "Hello, playground"
/*
 O(n)

 func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
     var hashMap = [Int: Int]()
     var result = [Int]()
     for (index, num) in nums.enumerated() {
         if let diffCount = hashMap[num] {
             result = [diffCount, index]
         }
         hashMap[target - num] = index
     }
     return result
 }

 print(twoSum([2,11,15, 7, 1, 1], 18))
 */

func twoSumUsingTwoPointer(_ nums: [Int], _ target: Int) -> [Int] {
    var a_pointer = 0
    var b_pointer = nums.count - 1
    
    while a_pointer <= b_pointer {
        let sum = nums[a_pointer] + nums[b_pointer]
        if sum < target { //increase a pointer
            a_pointer +=  1
            
        }  else if sum > target { //decrease b pointer
            b_pointer -=  1
        } else {
            return [a_pointer + 1, b_pointer + 1]
        }
    }
    
    return [a_pointer + 1, b_pointer + 1]
}

print("---new method--")
twoSumUsingTwoPointer([2, 7, 11, 15], 9)

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var result: [Int] = []

    for i in 0..<nums.count {
        let otherValue = target - nums[i]
        if result.contains(otherValue) {
            let otherIndex = result.firstIndex(of: otherValue)!
            if otherIndex != i {
                return [otherIndex, i]
            }
        } else {
            result.append(nums[i])
        }
    }

    return [0, 0]
}

let nums1 = [2, 7, 11, 15]
let target1 = 9
twoSum(nums1, target1)

let nums2 = [3, 2, 4]
let target2 = 6
twoSum(nums2, target2)


let nums3 = [3, 3]
let target3 = 6
twoSum(nums3, target3)

//This only work for sorted items
//using moving pointer approach

/* lower --- higer pointer :

 -- if lower < higer
 if sum is bigger then target ,  decrement higher
 if sum is smaller then target, increment lower
 if sum equal to target then , return [lower, higer]
 */

func twoSumPointer(_ nums: [Int], _ target: Int) -> [Int] {

    guard !nums.isEmpty else { return []}
    var i = 0 //lower bound
    var j = nums.count - 1 // upper bound
    var result: [Int] = []
    while i < j {
        let sum = nums[i] + nums[j]
        if sum == target {
            result.append(i)
            result.append(j)
            break
        }else if sum > target {
            j -= 1
        } else if sum < target {
            i += 1
        }
    }
    return result
}

twoSumPointer(nums1, target1)
twoSumPointer([3, 2, 4], 6)
twoSumPointer(nums3, target3)


//O(n) approach

func twoSumApproach(_ nums: [Int], _ target: Int) -> [Int] {

    var dict:[Int: Int] = [:]

    for (index, num) in nums.enumerated() {
        dict[num] = index
    }

    for (index, num) in nums.enumerated() {
        let otherNum = target - num

        if let otherIndex = dict[otherNum], otherIndex != index {
           return [index, otherIndex]
        }
    }
    return [0, 0]
}

twoSumApproach(nums2, target2)

// O(n2)
func twoSum1s(_ nums: [Int], _ target: Int) -> [Int] {
    for (index, data) in nums.enumerated() {
        let secondItem = target - data
        for(index2, _) in nums.enumerated() {
            if secondItem == nums[index2] && index2 != index {
                return [index, index2]
            }
        }
    }
    return [Int()]
}
