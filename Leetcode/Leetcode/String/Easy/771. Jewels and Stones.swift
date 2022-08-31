//
//  771. Jewels and Stones.swift
//  Leetcode
//
//  Created by Bandish on 01/09/2022.
//

import Foundation
//https://leetcode.com/problems/jewels-and-stones/
//771. Jewels and Stones

/*
 You're given strings jewels representing the types of stones that are jewels, and stones representing the stones you have. Each character in stones is a type of stone you have. You want to know how many of the stones you have are also jewels.

 Letters are case sensitive, so "a" is considered a different type of stone from "A".

 ex:
 Input: jewels = "aA", stones = "aAAbbbb"
 Output: 3
 
 Input: jewels = "z", stones = "ZZ"
 Output: 0
 */


func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
    var matchingCount = 0
    
    for st in stones { //O(n)
        if jewels.contains(st) { //O(n)
            matchingCount += 1
        }
    }
    return matchingCount //total time complexity O(n^2)
}

//using Dictionary
func numJewelsInStones2(_ jewels: String, _ stones: String) -> Int {
    
    var stoneDict: [Character: Int] = [:]
    
    for stone in stones { //O(n)
        if let val = stoneDict[stone] { //O(1)
            stoneDict[stone] = val + 1
        } else {
            stoneDict[stone] = 1
        }
    }
    
    
    //now iterate to jewels char & check in stones dict
    var result = 0
    for jewel in jewels { //O(n)
        if let val = stoneDict[jewel] { //O(1)
            result += val
        }
    }
    
    return result //total time complexity O(n)
}

