import UIKit

var str = "Hello, playground"

/*
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

 A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
 ---


 Input: digits = "23"
 Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
 Example 2:

 Input: digits = ""
 Output: []
 Example 3:

 Input: digits = "2"
 Output: ["a","b","c"]
 */
//0...25

///create hashmap for the alphabets based on their digit
///[7: ["p", "q", "r", "s"], 5: ["j", "k", "l"], 6: ["m", "n", "o"], 8: ["t", "u", "v"], 2: ["a", "b", "c"], 9: ["w", "x", "y", "z"], 3: ["d", "e", "f"], 4: ["g", "h", "i"]]
/// then check digit & get require letters from has map & loop it over esxisting result
func mapIntToLetters(start: Int, end: Int) -> [Int: [Character]]{
    let letters = Array("abcdefghijklmnopqrstuvwxyz")
    var result = Dictionary<Int, [Character]>()
    var count = 0
    
    for num in start...end {
       let offset = (num == 7 || num == 9) ? 4 : 3
        result[num] = Array(letters[count..<(count + offset)])
        count += offset
    }
    return result
}

func letterCombinations(_ digits: String) -> [String] {
    let dict = mapIntToLetters(start: 2, end: 9)
    var result: [String] = []
    
    for char in digits {
        let intChar = Int(String(char))!///convert char to Int "2" => 2,sothat get dict value for that number
        let letters = dict[intChar]!///get set of characters based on int key
        if result.count == 0 {
            result = letters.map { String($0)}
            continue
        }
        
        var newResult: [String] = []
        
        for letter in letters { ///loop over each character of dict key-value  eg: 2:abc, 3: def
            print(letter)
            print(result)
            for existStr in result {
                newResult.append("\(existStr)\(letter)") ///fst time: [a], ["a", "b"], ["a", "b", "c"]
                ///2nd time when letter d will come  ["ad"], ["ad", "bd"], ["ad", "bd", "cd"] same for e & f
                print("new result is::", newResult)
            }
        }
        result = newResult ///
    }
    
    return result
}

letterCombinations("23") // ["ad", "bd", "cd", "ae", "be", "ce", "af", "bf", "cf"]

letterCombinations("") //[]

