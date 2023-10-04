import UIKit

var greeting = "Hello, playground"

/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 */
//243
//504
//708 ==o/p , since mentioned above digits are stored in reverse order, then we can add number from right to left

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(val)"
        }
        return "\(val) -> " + String(describing: next) + " "
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

    // Get a mutable reference to each head of l1 and l2
    var list1 = l1
    var list2 = l2

    // Create a reference to a node we're going to append on
    let head: ListNode? = ListNode()
    var result: ListNode? = head


    var carry = 0
    while (list1 != nil || list2 != nil ) {

        var value1: Int = 0
        var value2: Int = 0

        if let l1 = list1 {
            value1 = l1.val
            list1 = list1?.next
        }

        if let l2 = list2 {
            value2 = l2.val
            list2 = list2?.next
        }

        let sum = value1 + value2 + carry //if any prev carry, then add now

        let value = sum % 10 // this value insert to node

        carry = sum / 10 // carry will forward & add to the next nodes summation


        result?.next = ListNode(value) // Add a node with the new value

        //now check is result's next exist then only store the node value
        if let nodeValue = result?.next { //this will stop end loop
            result = nodeValue
        }
    }

    // If we still have carry left
    if carry > 0 {
        /**
               Add a node for the carry.
               This case could happen on
               (9 -> 9) + (1) = (0 -> 0 -> 1)
               */

        result?.next = ListNode(carry)
    }

    //Return head.next to lose the -1 dummy head
    return head?.next
}

//Input: l1 = [2,4,3], l2 = [5,6,4]
//Output: [7,0,8]
//Explanation: 342 + 465 = 807.
let thrdValue = ListNode(3, nil)
let scndValue = ListNode(4, thrdValue)
let fstValue = ListNode(2, scndValue)

fstValue

let zValue = ListNode(4, nil)
let yValue = ListNode(6, zValue)
let xValue = ListNode(5, yValue)

addTwoNumbers(fstValue, xValue)
