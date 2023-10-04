import UIKit

var str = "Hello, playground"
/*
 111. Minimum Depth of Binary Tree
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
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let leftHeight = minDepth(root.left)
        let rightHeight = minDepth(root.right)
        return ((leftHeight == 0 || rightHeight == 0) ?  max(leftHeight, rightHeight) : min(leftHeight, rightHeight)) + 1
    }
}

var treeNode = TreeNode()
//[3,9,20,null,null,15,7]
var a = TreeNode(3)
var b = TreeNode(9)
var c = TreeNode(20)
var d = TreeNode(15)
var e = TreeNode(7)

a.left = b
a.right = c

c.left = d
c.right = e
print(a)
treeNode.minDepth(a)


