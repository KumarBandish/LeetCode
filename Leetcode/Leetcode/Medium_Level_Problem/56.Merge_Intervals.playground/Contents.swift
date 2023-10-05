import UIKit

var str = "Hello, playground"
/*
 Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.
 
 /----
 Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 
 -----
 Input: intervals = [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
 
 */

func merge(_ intervals: [[Int]]) -> [[Int]] {
    if intervals.count <= 1 {
        return intervals
    }
    var answer = [[Int]]()
    var array = intervals
    
    
    array.sort{(arr1,arr2) -> Bool in
        if arr1[0] < arr2[0] {
            return true
        }  else {
            return false
        }  }
    
    
    var current = array[0]
    for interval in array {
        if interval[0] <= current[1] {
            current[1] = max(current[1],interval[1])
        } else {
            answer.append(current)
            current = interval
        }
    }
    if !answer.contains(current){
        answer.append(current)
    }
    return answer
}
