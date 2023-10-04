import UIKit

/*
 Given a string s, find the length of the longest substring without repeating characters.
 */
//Input: s = "abcabcbb"
//Output: 3
//Explanation: The answer is "abc", with the length of 3.


// use sliding window approach
// keep two pointers - one points to begining & second will iterate over character
// check max
func lengthOfLongestSubstring(_ s: String) -> Int {

    var hashSet: [Character] = []
    var result = 0

    for char in s {

        if let index = hashSet.firstIndex(of: char) {
            result = max(hashSet.count, result)
            hashSet.removeSubrange(0...index)
        }
        hashSet.append(char)
//        if !hashSet.contains(char) {
//            hashSet.append(char)
//            result = max(hashSet.count, result) //store this max
//        } else {
//            hashSet = [char] //start array with new character
//        }
    }
    return max(hashSet.count, result)
}


let s1 = "abcabcbb"
let s2 = "pwwkew"
let s3 = " "
let s4 = "dvdf"
let s5 = "ABCDEFDIVGHIJKLMNICPCOPQRSTUVWXYZO"


lengthOfLongestSubstring(s5)

