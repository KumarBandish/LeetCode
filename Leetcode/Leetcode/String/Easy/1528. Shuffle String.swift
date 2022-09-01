//
//  1528. Shuffle String.swift
//  Leetcode
//
//  Created by Bandish on 01/09/2022.
//

import Foundation

//https://leetcode.com/problems/shuffle-string/

/*
 You are given a string s and an integer array indices of the same length. The string s will be shuffled such that the character at the ith position moves to indices[i] in the shuffled string.
 
 Return the shuffled string.
 
 --e.g:
 Input: s = "codeleet", indices = [4,5,6,7,0,2,1,3]
 Output: "leetcode"
 Explanation: As shown, "codeleet" becomes "leetcode" after shuffling.
 */

func shuffleString(_ s: String, _ indices: [Int]) -> String {
    var dict: [Int: Character] = [:]
    
    for (index, char) in s.enumerated() {
        let dictIndex = indices[index]
        dict[dictIndex] = char
    }
    
    var result = ""
    for i in 0..<indices.count {
        if let val = dict[i] {
            result += String(val)
        }
    }
    
    return result //total time complexity O(n)
    
}


//diff approach::
func restoreString(_ s: String, _ indices: [Int]) -> String {
    let requestedString = Array(s)
    var resultedArray = [Character](repeating: " ", count: indices.count)
    
    for i in 0..<indices.count {
        resultedArray[indices[i]] = requestedString[i]
    }
    
    return String(resultedArray)
}
