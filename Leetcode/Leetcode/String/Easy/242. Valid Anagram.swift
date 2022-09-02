//
//  242. Valid Anagram.swift
//  Leetcode
//
//  Created by Bandish on 01/09/2022.
//

import Foundation
//https://leetcode.com/problems/valid-anagram/

/*
 Given two strings s and t, return true if t is an anagram of s, and false otherwise.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once
 
 example ::
 Input: s = "anagram", t = "nagaram"
 Output: true
 */

func isAnagram(_ s: String, _ t: String) -> Bool {
    var dict: [Character: Int] = [:]

    
    if s.count != t.count {
        return false
    } else {
        //add first string in dict
        for char in s {
            if let val = dict[char] {
                dict[char] = val + 1
            } else {
                dict[char] = 1
            }
        }
        
        //now we will iterate to second string
        //and start removing from dict if it matches
        //if dict is empty means i.e anagram
        
        for char in t {
            if let val = dict[char] {
                if val == 1 {
                    dict.removeValue(forKey: char)
                } else {
                    dict[char] = val - 1
                }
            } else {
                return false
            }
        }
        
    }
    
   print(dict)
    return dict.isEmpty
}
