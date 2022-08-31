//
//  2114. Maximum Number of Words.swift
//  Leetcode
//
//  Created by Bandish on 31/08/2022.
//

import Foundation

//https://leetcode.com/problems/maximum-number-of-words-found-in-sentences/
/*
 A sentence is a list of words that are separated by a single space with no leading or trailing spaces.

 You are given an array of strings sentences, where each sentences[i] represents a single sentence.

 Return the maximum number of words that appear in a single sentence.
 */
//Input: sentences = ["alice and bob love leetcode", "i think so too", "this is great thanks very much"]
//Output: 6

func mostWordsFound(_ sentences: [String]) -> Int {
    var result = 0
    for item in sentences {
        let wordCount = item.components(separatedBy: " ").count
        result = max(result, wordCount)
    }
    return result
}
