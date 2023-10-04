import UIKit

var str = "Hello, playground"

/*
 Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).
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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true}
        return isMirror(root1: root.left, root2: root.right)
    }
    
    func isMirror(root1: TreeNode?, root2: TreeNode?) -> Bool {
        if root1 == nil, root2 == nil { //if there is no left, right child means, no subtree, only root is there-> return true
            return true
        } else if root1 == nil || root2 == nil { //if there is any left, right child no available, means it's unbalance-> return false
            return false
        } else {
            return (root1!.val == root2!.val) && (isMirror(root1: root1?.left, root2: root2?.right)) && (isMirror(root1: root1?.right, root2: root2?.left))
        }
       
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
tree.isSymmetric(a)

////[1,2,2,3,4,3, 4]

c.left = g
c.right = f

tree.isSymmetric(a)

