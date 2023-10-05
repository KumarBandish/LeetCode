import UIKit

var str = "Hello, playground"
/*
 --- all unique combinations of candidates
 
 Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.

 The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.

 It is guaranteed that the number of unique combinations that sum up to target is less than 150 combinations for the given input.
 
 //Input: candidates = [2,3,6,7], target = 7
 Output: [[2,2,3],[7]]
 Explanation:
 2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
 7 is a candidate, and 7 = 7.
 These are the only two combinations.
 //
 Input: candidates = [2], target = 1
 Output: []
 
 //
 Input: candidates = [2,3,5], target = 8
 Output: [[2,2,2,2],[2,3,3],[3,5]]
 */

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var result: [[Int]] = []
    var cand = candidates.sorted()
    recursiveSum(list: [Int](), &cand, target, result: &result, index: 0)

    return result
}

func recursiveSum(list: [Int], _ candidates: inout [Int], _ target: Int, result: inout [[Int]], index: Int) {
    
    if target == 0 {
        result.append(list)
    }
    
    if target < 0 {
        return
    }
    for i in index..<candidates.count {
        let newTarget = target - candidates[i]
        var copy = list
        copy.append(candidates[i])
        recursiveSum(list: copy, &candidates, newTarget, result: &result, index: i)
    }
}

//here we have to avoid all duplicate solution

//so, first sort the all candidates value

// while recursive call pass index to tracking for next value & store latest value in list--> assign list value in result

combinationSum([2,3,6,7], 7) //[[2, 2, 3], [2, 3, 2], [3, 2, 2], [7]] ==> [[2, 2, 3], [7]]


combinationSum([2, 3, 5], 8) //[[2, 2, 2, 2], [2, 3, 3], [3, 5]]

