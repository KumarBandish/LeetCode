import UIKit

var str = "Hello, playground"

/*
 Find all valid combinations of k numbers that sum up to n such that the following conditions are true:

 Only numbers 1 through 9 are used.
 Each number is used at most once.
 Return a list of all possible valid combinations. The list must not contain the same combination twice, and the combinations may be returned in any order.

//
 Input: k = 3, n = 7
 Output: [[1,2,4]]
 Explanation:
 1 + 2 + 4 = 7
 There are no other valid combinations.
 
 //
 Input: k = 3, n = 9
 Output: [[1,2,6],[1,3,5],[2,3,4]]
 Explanation:
 1 + 2 + 6 = 9
 1 + 3 + 5 = 9
 2 + 3 + 4 = 9
 There are no other valid combinations.
 */


func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
    var result: [[Int]] = []
    let candidates = Array(1...9) //only 1 to 9 number allowed
    recursiveSum([Int](), candidates, k, n, &result, 0)
    return result
}


func recursiveSum(_ list: [Int],_ candidates: [Int],_ k: Int, _ n: Int, _ result: inout [[Int]],_ startIndex: Int) {
    
    if n < 0 {
        return
    }
    
    if n == 0 {
        if list.count == k {
            result.append(list)
        }
        return
    }
    
    for i in startIndex..<candidates.count {
        let newN = n - candidates[i]
        var copy = list
        copy.append(candidates[i])
        recursiveSum(copy, candidates, k, newN, &result, i + 1) // i + 1 so that same element should be not repeat.
    }
}

combinationSum3(3, 7) //[[1,2,4]]
combinationSum3(3, 9) // [[1, 2, 6], [1, 3, 5], [2, 3, 4]]
combinationSum3(4, 1) // []
combinationSum3(9, 45)
