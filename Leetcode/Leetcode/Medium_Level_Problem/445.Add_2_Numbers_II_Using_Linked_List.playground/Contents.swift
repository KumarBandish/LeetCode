import UIKit

var greeting = "Hello, playground"

/*
 You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 */
//7243
// 564
//7807 ==o/p , since mentioned most significant digit comes first, then we can add number from left to right -- as normal



// approach --
//1: reverse both the linked list then perfrom addition , after additon of both linked list to get require result now again reverse the result list
// here time complexity & space complexity will more

//2: use two stacks, pust both linked list in seperate stacks. Perform addition of both stacks & store sum in linked list.

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

//using 2 stacks approach
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var node1 = l1
    var node2 = l2
    var stack1:[Int]? = []
    var stack2:[Int]? = []

    while node1 != nil || node2 != nil {
        if let nd1 = node1 {
            stack1?.append(nd1.val)
            node1 = node1?.next
        }
        if let nd2 = node2 {
            stack2?.append(nd2.val)
            node2 = node2?.next
        }
    }

    var stack1Top = (stack1?.count ?? 0) - 1
    var stack2Top = (stack2?.count ?? 0) - 1
    var resultNode: ListNode?
    var carry = 0

    while stack1Top != -1 ||  stack2Top != -1 {
        var sum = 0
        //to stop out of range error // stack1Top >= 0
        if stack1Top >= 0, let val1 = stack1?[stack1Top]  {
            sum = val1
            stack1Top -= 1
        }

        if stack2Top >= 0, let val2 = stack2?[stack2Top] {
            sum += val2
            stack2Top -= 1
        }

        sum += carry
        let value = sum % 10
        carry = sum / 10
        //new node will be the first node of result
        if let node = resultNode {
            resultNode = ListNode(value, node) // 0->7 , already node 7 has added, then coming to new node 0 -- 0 next node will be 7
        } else {
            resultNode = ListNode(value) // 7
        }

    }

    if carry > 0 {
        //new node will be head of result node
        // carry->result node
        resultNode = ListNode(carry, resultNode)
    }

    return resultNode
}

let frthValue = ListNode(3, nil)
let thrdValue = ListNode(4, frthValue)
let scndValue = ListNode(2, thrdValue)
let fstValue = ListNode(7, scndValue)

fstValue

let zValue = ListNode(4, nil)
let yValue = ListNode(6, zValue)
let xValue = ListNode(5, yValue)

addTwoNumbers(fstValue, xValue)
