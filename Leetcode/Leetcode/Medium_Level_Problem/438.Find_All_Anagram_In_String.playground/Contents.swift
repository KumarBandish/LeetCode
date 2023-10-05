import UIKit

var str = "Hello, playground"
/*
 Given two strings s and p, return an array of all the start indices of p's anagrams in s. You may return the answer in any order.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
 
 Input: s = "cbaebabacd", p = "abc"
 Output: [0,6]
 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".
 */

func findAnagrams(_ s: String, _ p: String) -> [Int] {
        
    var pDict: [String: Int] = [:]
    
    for char in p {
        if let count = pDict[String(char)] {
            pDict[String(char)] = count + 1
        } else {
            pDict[String(char)] = 1
        }
    }
    
    var i = 0
    var sArray = Array(s)
    
    while i < sArray.count {
        
    }
    
    print(pDict)
        return [1]
 }

let s = "cbaebabacd"
let p = "abc"
findAnagrams(s, p)

