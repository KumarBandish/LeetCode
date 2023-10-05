import UIKit

var str = "Hello, playground"

/*
 Given the head of a linked list, return the list after sorting it in ascending order.
 
 //
 Input: head = [4,2,1,3]
 Output: [1,2,3,4]
 ---
 Input: head = [-1,5,3,4,0]
 Output: [-1,0,3,4,5]
 */

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
/*
 1 way:
  put all values in one array -- then sort it ---- make linked list from that array value
 
 2nd way:
 merge each-2 linked list in one list , till all list is not getting merged. then use sorting approach of one linked list
 
 */


func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    var stack1: [Int]? = []
//    let dummy = ListNode(0)
//    let result: ListNode? = dummy
//    let allLists = lists
    
    var resultNode: ListNode?
    
    //get one list
    for i in 0..<lists.count {
        var firstList = lists[i]
        while firstList != nil {
            stack1?.append(firstList!.val)
            firstList = firstList?.next
        }
    }
    
    var stackTop = (stack1?.count ?? 0) - 1
    
    while stackTop != -1 {
        let value = stack1![stackTop]
        if let node = resultNode {
            resultNode = ListNode(value, node)
        } else {
            resultNode = ListNode(value)
        }
        stackTop -= 1
    }
    
    print("all dummy list", resultNode)
    
    let sortLinkedList = sortList(resultNode)
    
    print("after sorting the linked list", sortLinkedList)
    return sortLinkedList
}

func sortList(_ head: ListNode?) -> ListNode? {
    var temp: ListNode? = nil
    var slow = head
    var fast = head
    
    if head == nil || head?.next == nil {
        return head
    }
    //middle of linked list
    while fast != nil, fast?.next != nil {
        temp = slow
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    temp?.next = nil
    
    let left = sortList(head)
    let right = sortList(slow)
    
    return mergeLinkedList(left: left, right: right)
}

//how to add two listNode
func mergeLinkedList(left: ListNode?, right: ListNode?) -> ListNode? {
    let dummy = ListNode(0)
    var l1 = left
    var l2 = right
    
    var current: ListNode? = dummy
    
    while l1 != nil, l2 != nil {
        if l1!.val < l2!.val {
            current?.next = l1
            l1 = l1?.next
        } else {
            current?.next = l2
            l2 = l2?.next
        }
        current = current?.next
    }
    
    if l1 != nil {
        current?.next = l1
    }
    
    if l2 != nil {
        current?.next = l2
    }
    
    return dummy.next
}

let frthValue = ListNode(3, nil)
let thrdValue = ListNode(1, frthValue)
let scndValue = ListNode(2, thrdValue)
let fstValue = ListNode(4, scndValue)

fstValue

let zValue = ListNode(4, nil)
let yValue = ListNode(6, zValue)
let xValue = ListNode(5, yValue)

xValue

let allLists = [fstValue,xValue]
print(allLists)

mergeKLists(allLists)
//mergeLinkedList(left: fstValue, right: xValue)

//sortList(fstValue)
