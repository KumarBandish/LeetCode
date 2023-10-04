import UIKit

var str = "Hello, playground"
/*
 Given the root of a binary tree and an integer targetSum, return true if the tree has a root-to-leaf path such that adding up all the values along the path equals targetSum.

 A leaf is a node with no children
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
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        var nodeStack: [TreeNode] = []
        var sumStack: [Int] = []
        nodeStack.append(root)
        sumStack.append(targetSum - root.val)
        
        while !nodeStack.isEmpty {
            let currentNode = nodeStack.popLast()
            let currentSum = sumStack.popLast()
            
            if currentNode?.left == nil && currentNode?.right == nil && currentSum == 0 {
                return true
            }
            
            if let leftNode = currentNode?.left {
                nodeStack.append(leftNode)
                sumStack.append(currentSum! - leftNode.val)
            }
            
            if let rightNode = currentNode?.right {
                nodeStack.append(rightNode)
                sumStack.append(currentSum! - rightNode.val)
            }
        }
        
        return false
    }
}

var treeNode = TreeNode()
//[3,9,20,null,null,15,7]
var a = TreeNode(1)
var b = TreeNode(2)
var c = TreeNode(3)


a.left = b
a.right = c

print(a)
treeNode.hasPathSum(a, 5)
