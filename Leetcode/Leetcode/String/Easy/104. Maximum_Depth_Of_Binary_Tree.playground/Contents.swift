import UIKit

var str = "Hello, playground"
/*
 Given the root of a binary tree, return its maximum depth.

 A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 */

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
    
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let leftHeight = maxDepth(root.left)
        let rightHeight = maxDepth(root.right)
        return max(leftHeight, rightHeight) + 1
    }
    
}


//[1,2,2,3,4,4,3]

let a = TreeNode(1)
let b = TreeNode(2)
let c = TreeNode(2)
let d = TreeNode(3)
let e = TreeNode(4)
let f = TreeNode(4)
let g = TreeNode(3)

a.left = b
a.right = c

b.left = d
b.right = e

c.left = f
c.right = g


print(a)
var tree = TreeNode()
tree.maxDepth(a) //3
