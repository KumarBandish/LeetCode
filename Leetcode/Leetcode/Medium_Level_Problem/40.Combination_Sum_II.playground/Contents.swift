import UIKit

var str = "Hello, playground"
/*
 -- might be collection of repeated candidate number
 
 Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target.

 Each number in candidates may only be used once in the combination.

 Note: The solution set must not contain duplicate combinations.
 
 //
 Input: candidates = [10,1,2,7,6,1,5], target = 8
 Output:
 [
 [1,1,6],
 [1,2,5],
 [1,7],
 [2,6]
 ]
 
 //
 Input: candidates = [2,5,2,1,2], target = 5
 Output:
 [
 [1,2,2],
 [5]
 ]
 */

//not duplicate set allowed
/*
step1: sort the candidates
step2: write diff menthod & pass target, candidates, starting Index, results, list(which keep track for candidate in each iteration)
step3: check condition for target == 0 & target < 0
 
step4: iterate candidates, calculate new target
      -- imp step: check current & prev candidate is same then continue the loop till get diff candidate value for current & prev
 ------- if current & prev value is diff then
 ------- add current candidate in list
 -------- call recursive method with index + 1
 
*/
func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var result = [[Int]]()
    recursiveSum([Int](), candidates.sorted(), &result, target, 0)
    return result
}


func recursiveSum(_ list: [Int], _ candidates: [Int], _ result: inout [[Int]],_ target: Int, _ startIndex: Int) {
    
    if target < 0 {
        return
    }
    
    if target == 0 {
        result.append(list)
        return
    }
    
    for i in startIndex..<candidates.count {
        let newTargetValue = target - candidates[i]
        
        //to check duplication , if there go to next element
        // Important step
        if i != startIndex, candidates[i] == candidates[i - 1] {
            continue
        }
        var copy = list
        copy.append(candidates[i])
        recursiveSum(copy, candidates, &result, newTargetValue, i + 1) //i + 1 check for next index
    }
}

combinationSum2([2,5,2,1,2], 5) //[[1, 2, 2], [5]]
combinationSum2([10,1,2,7,6,1,5], 8) //[[1, 1, 6], [1, 2, 5], [1, 7], [2, 6]]


