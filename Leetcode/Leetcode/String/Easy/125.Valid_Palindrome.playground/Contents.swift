import UIKit

var greeting = "Hello, playground"

/*
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

 Given a string s, return true if it is a palindrome, or false otherwise.
 */


func isPalindrome(_ s: String) -> Bool {
    let str1 = Array(s.alphanumeric)
    for i in 0..<(str1.count / 2) {
        if str1[i] != str1[str1.count - 1 - i] {
            return false
        } else {
            continue
        }
    }
    return true
}

extension String {
    var alphanumeric: String {
        return self.lowercased().replacingOccurrences(of: "[^a-z0-9]", with: "", options: .regularExpression)
    }
}

let str1 = "A man, a plan, a canal: Panama"
isPalindrome(str2)

let str2 = "ft"
isPalindrome(str2)

isPalindrome("  ")
