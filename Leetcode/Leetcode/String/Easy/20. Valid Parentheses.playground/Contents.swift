import UIKit

var greeting = "Hello, playground"

/*
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 */

//use array as stack & perform push/pop

func isValid(_ s: String) -> Bool {
    let bracket = "({["
    let dict: [Character: Character] = ["(" : ")", "{": "}", "[" : "]"]
    var result: [Character] = []
    for char in s {
        if bracket.contains(char) {
            let value = dict[char]
            result.append(value!)
        } else {
            if let value = result.popLast(), value == char {
                continue
            } else {
                return false
            }

        }
    }

    return result.isEmpty

}
 // step1 : create bracket string of available
// make on dict using open-close bracket, so that store closing brackets for upcoming opening brackets
// check if bracket contains that char -- then stroe its closing pairs in array using dict value
// if bracket does not contains upcoming char -- then pop last char from array & check it's value is same then continue for next item
/// else break the loop means wrong pattern
///



isValid("()")

isValid("({{}})")

isValid("(]")

isValid("({}")

isValid("({}[])")


//or

func matchingBrackets(_ input: String) -> Bool {
    var stack: [Character] = []
    let dict: [Character: Character] = ["(" : ")", "{": "}", "[": "]"]

    for char in input {
        if let value = dict[char] {
            stack.append(value)
        } else if char == stack.last {
            stack.popLast()
        } else {
            return false
        }
    }

    return stack.isEmpty
}

matchingBrackets("(")


/*
class Stack<T> {
private var result: [T] = []
var top: T {
return result.last()
}

func push(_ char: T) {
result.append(char)

}

func pop() -> T {

return result.popLast()

}

func isEmpty() -> Bool {
return result.isEmpty
}
}


func isValid(input: String) -> Bool {

 var stack = Stack<Character>()
let matchingBrackets = ["(": ")", "{": "}", "[": "]"]

for char in input {
if let value = matchingBrackets[char] {
stack.push(value)
} else if char == stack.top {
stack.pop()
} else {
return false
}
}

return stack.isEmpty

}
*/
