import UIKit

var str = "Hello, playground"
/*
 Given the root of a Binary Search Tree and a target number k, return true if there exist two elements in the BST such that their sum is equal to the given target.
 */
//step 1: sort the array increasing order :: inorder traversal
//step 2: using 2 pointer approach find the values for sum

//Time complexity : O(n)
//Space complexity: O(n)
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

extension TreeNode: CustomStringConvertible {

    public var description: String {
        return diagram(for: self)
    }

    func diagram(for node: TreeNode?, _ top: String = "", _ root: String = "" ,_ bottom: String = "") -> String {
        guard let node = node else { return root + "nil\n" }
        if node.left == nil, node.right == nil {
            return root + "\(node.val)\n"
        }
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ") + root + "\(node.val)\n" + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom )
    }
}

extension TreeNode {
   
    func getList(_ value: TreeNode?) -> [Int] {
        var values: [Int] = []
        value?.findInOrderTraversal(root: { value in
            values.append(value)
        })
        
        return values
    }
    
    func findInOrderTraversal(root: (Int) -> Void) {
        left?.findInOrderTraversal(root: root)
        root(val)
        right?.findInOrderTraversal(root: root)
        
    }
    
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        guard let root = root else {
            return false
        }
        let allNodes = getList(root) //get sorted data using inorder
        print(allNodes)
        //using two pointer approach
        var aPointer = 0
        var bPointer = allNodes.count - 1
        
        while aPointer < bPointer {
            let sum = allNodes[aPointer] + allNodes[bPointer]
            if k > sum {
                bPointer -= 1
            } else if k < sum {
                aPointer += 1
            } else {
                return true
            }
        }
        return false
    }
    
}


//[5,3,6,2,4,null,7], k = 9

let a = TreeNode(5)
let b = TreeNode(3)
let c = TreeNode(6)
let d = TreeNode(2)
let e = TreeNode(4)
let f = TreeNode(7)


a.left = b
a.right = c

b.left = d
b.right = e

c.right = f



print(a)
var tree = TreeNode()
tree.findTarget(a, 9)
