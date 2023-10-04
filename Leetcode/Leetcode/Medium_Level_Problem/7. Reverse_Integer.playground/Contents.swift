import UIKit

var str = "Hello, playground"
/*
 Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

 Assume the environment does not allow you to store 64-bit integers (signed or unsigned).
 
 Input: x = 123
 Output: 321
 */
func reverse(_ x: Int) -> Int {
    var reverseNumber = 0
    var number = x
    while number != 0 {
        let module = number % 10
        number = number / 10
        reverseNumber = reverseNumber * 10 + module
    }
    if reverseNumber > Int32.max || reverseNumber < Int32.min {
        return 0
    }
    return reverseNumber
}

let x1 = 123 //321
let x2 = -123 //-321
let x3 = 120 //21
let x4 = 0 //0
let x5 = 1534236469 //0 : more than 32 bit
reverse(x1)
reverse(x2)
reverse(x3)
reverse(x4)
reverse(x5)
