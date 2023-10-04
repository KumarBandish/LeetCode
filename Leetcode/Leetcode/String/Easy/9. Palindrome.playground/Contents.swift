import UIKit

var greeting = "Hello, playground"

func isPalindrome(_ x: Int) -> Bool {

    let value = String(x)
    let elements = Array(value)
    let count = elements.count

    for i in 0..<count / 2 {
        if elements[i] != elements[count - 1 - i] {
            return false
        } else {
            continue
        }

    }
    return true

}

isPalindrome(121)
isPalindrome(-121)
isPalindrome(10)
isPalindrome(-101)


//Note-> Could you solve it without converting the integer to a string?


func checkPalindrome(_ x: Int) -> Bool {

    if x < 0 {
        return false
    }
    var givenNumber = x
    var revertedNumber = 0
    while givenNumber != 0 {
        revertedNumber = revertedNumber * 10 // to move next position 1-> ten-> hundred
        revertedNumber = revertedNumber + givenNumber % 10
        givenNumber = givenNumber / 10
    }

    if x == revertedNumber {
        return true
    }
    return false


}

checkPalindrome(-101)

/*

 //step 1: iterate over all numbers till number didn't become 0
 /*step 2:

     123 - 3 will be now first --123 % 10 = 3
     remaining number will be 12. -- 123 / 10

  step 3: when again loop will iterate -- then new number will be on next place
  then before updating reverse
    reverse = (reverse * 10) + number % 10
  */

 */
