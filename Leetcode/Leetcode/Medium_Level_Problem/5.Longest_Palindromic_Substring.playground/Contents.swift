import UIKit

var greeting = "Hello, playground"
/*
 Given a string s, return the longest palindromic substring in s.
 
 
 Input: s = "babad"
 Output: "bab"
 Note: "aba" is also a valid answer.
 
 Input: s = "cbbd"
 Output: "bb"
 
 Input: s = "a"
 Output: "a"
 */

//Brute - force approach
//this will fails if input:: "ac"

func longestPalindrome(_ s: String) -> String {
    
    var listOfSubStrings: [String] = []
    let arrString = Array(s)
    var listOfPalindrome: [String] = []
    //list of all substrings
    for i in 0..<arrString.count {
        for j in (i + 1)..<arrString.count {
            listOfSubStrings.append(String(arrString[i...j]))
        }
    }
    print(listOfSubStrings)
    //list of all palindrome
    for element in listOfSubStrings {
        if checkIsPalindrome(st: element) {
            listOfPalindrome.append(element)
        }
    }
    
    print(listOfPalindrome)
    //length of max palindrome
    var maxLength = 0
    var maxLengthIndex: Int?
    for index in 0..<listOfPalindrome.count {
        if maxLength < listOfPalindrome[index].count {
            maxLength = listOfPalindrome[index].count
            print(listOfPalindrome[index])
            maxLengthIndex = index
        }
    }
    guard let index = maxLengthIndex else {
        return ""
    }
    return listOfPalindrome[index]
}

func checkIsPalindrome(st: String) -> Bool {
    let arraySt = Array(st)
    for i in 0..<arraySt.count / 2 {
        if arraySt[i] != arraySt[arraySt.count - 1 - i] {
            return false
        } else {
            continue
        }
    }
    return true
}

let s1 = "babad"
longestPalindrome(s1) //bab , aba anyone

let s2 = "ac"
longestPalindrome(s2) // bb


//

//Diff approach

//racecar ::here e is in middle, left & righr char of that r same
//aaabbaaa::b-left b-right both  strings r same
//
func checkLongestPalindrome(s: String) -> String {
    
    if s.isEmpty || s.count < 1 {
        return ""
    }
    if s.count == 1 {
        return s
    }
    
    var start = 0 // start & end pointer move to the left & right if matching char found
    var end = 0
    
    for i in 0..<s.count {
        let length1 = expandFromMiddle(s: s, left: i, right: i) //aabba
        let length2 = expandFromMiddle(s: s, left: i, right: i + 1) //racecar
        let length = max(length1, length2)
        print("--length", length)
        
        // calculate start & end offset of strings. Using that index we can arrange character
        if (length > end - start) {
            start = i - ((length - 1) / 2)
            end = i + (length - 1 / 2)
        }
    }
    print(start, end)
    let left = s.index(s.startIndex, offsetBy: start)
    let right = s.index(s.startIndex, offsetBy: start + end - 1)
    let range = left...right
    return String(s[range])
}

func expandFromMiddle(s: String, left: Int, right: Int) -> Int {
    var left = left
    var right = right
    if s.isEmpty || left > right {
        return 0
    }
    //find the middle of element-->left  decrease by 1 & right increase by 1 from middle
    //to check palindrome check that left & right index th value be same
    //if not same then break the loop
    while left >= 0 && right < s.count && s[s.index(s.startIndex, offsetBy: left)] == s[s.index(s.startIndex, offsetBy: right)] {
        left -= 1
        right += 1
    }
    //return the range of palindrome
    
    return right - left - 1
}


let str1 = "ac" //output ==> a || c

checkLongestPalindrome(s: str1)
 
let str2 = "bb" // output ==> bb

let str3 = "cbbd"

checkLongestPalindrome(s: str3)
