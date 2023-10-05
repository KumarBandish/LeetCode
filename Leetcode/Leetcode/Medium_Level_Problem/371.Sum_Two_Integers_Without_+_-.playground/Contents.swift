import UIKit

var greeting = "Hello, playground"
/*
 Given two integers a and b, return the sum of the two integers without using the operators + and -
 */
//Input: a = 1, b = 2
// Output: 3

//logic design concept

//xor = 0 1 or 1 0 => 1, 0 0 => 0 , 1 1=> 0
// & then right shift by 1
// perform xor and & operation till there no carry means 1 1

func getSum(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    //b as carry
    while b != 0 {
        let carry = a & b //&  operation with 2 numbers & if carry move right <<
        a = a ^ b  // xor operation with both numbers
        b = carry << 1
    }

    return a
}
let a = 2
let b = 3

getSum(a, b)
