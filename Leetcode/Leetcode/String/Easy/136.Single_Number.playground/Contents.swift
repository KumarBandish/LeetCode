import UIKit

var greeting = "Hello, playground"
/*
 Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

 You must implement a solution with a linear runtime complexity and use only constant extra space.
 */

func singleNumber(_ nums: [Int]) -> Int {
    var dict: [Int: Int] = [:]
    for num in nums {
        if let value = dict[num] {
            dict[num] = value + 1
        } else {
            dict[num] = 1
        }
    }

    //check single number means value count == 1

    for (key, value) in dict {
        if value == 1 {
            return key
        }
    }
    return 0

}

let nums = [2,2,1]
singleNumber(nums)

let nums2 = [1]
singleNumber(nums2)

let num3 = [4,1,2,1,2]
singleNumber(num3)
