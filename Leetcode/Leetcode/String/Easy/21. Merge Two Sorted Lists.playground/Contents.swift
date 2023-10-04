import UIKit

var str = "Hello, playground"
/*
 You are given the heads of two sorted linked lists list1 and list2.

 Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.

 Return the head of the merged linked list.
 
 //
 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]
 //
 Input: list1 = [], list2 = [0]
 Output: [0]
 */


 // Definition for singly-linked list.
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
            return " \(val) "
        }
        return "\(val) " + String(describing: next) + " "
    }
}

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    let head: ListNode? = ListNode()
    var currentNode = head
    
    var l1 = list1
    var l2 = list2
    while l1 != nil, l2 != nil {
        let value1 = l1!.val
        let value2 = l2!.val
        if value1 < value2 { //ascending order then
            currentNode?.next = l1
            l1 = l1?.next
        } else {
            currentNode?.next = l2
            l2 = l2?.next
        }
        currentNode = currentNode?.next
    }
    
    if l1 != nil {
        currentNode?.next = l1
        l1 = l1?.next
    }
    if l2 != nil {
        currentNode?.next = l2
        l2 = l2?.next
    }
    
    return head?.next
}

//list1 = [1,2,4], list2 = [1,3,4]
var first1 = ListNode(1)
var second1 = ListNode(2)
var fourth1 = ListNode(4)

first1.next = second1
second1.next = fourth1

let list1 = first1
print(list1)

var first2 = ListNode(1)
var third2 = ListNode(3)
var fourth2 = ListNode(4)
first2.next = third2
third2.next = fourth2

let list2 = first2
print(first2)

mergeTwoLists(list1, list2) //1 1 2 3 4 4



/*
func mergerTwoArray(list1: [Int], list2: [Int]) {
    var result: [Int] = []
    var i = 0
    var j = 0
    
    while i < list1.count || j < list2.count {
        //[1, 3, 6] && [2, 4, 7]
        if list1[i] > list2[j] {
            result.append(list2[j])
            if j != list2.count - 1 {
                j += 1
            } else {
                result.append(contentsOf: list1[i..<list1.count]) //add remaining element of first array
                break
            }
           
        } else if list1[i] < list2[j] {
            result.append(list1[i])
            if i != list1.count - 1 {
                i += 1
            } else {
                result.append(contentsOf: list2[j..<list2.count]) ////add remaining element of second array
                
                break
            }
           
        }
    }
    
    if i != list1.count - 1 {
        result.append(contentsOf: list1[i...list1.count])
    }
    
    if j != list2.count - 1 {
        result.append(contentsOf: list2[j...list2.count])
    }
    
    
    print(result)
    
}

mergerTwoArray(list1: [1, 3, 6], list2: [2, 4, 7]) //[1, 2, 3, 4, 6, 7]
*/
