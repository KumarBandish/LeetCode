import UIKit

var str = "Hello, playground"

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
        return  String(describing: left) + " " + " \(val) "  + " " + String(describing: right)
    }
}
//add below code to leet code for inorder traversal
extension TreeNode {
    func traversal(value: (Int) -> Void) {
        left?.traversal(value: value)
        value(val)
        right?.traversal(value: value)
    }
}

// this is leet code method,
func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var values: [Int] = []
    
    root?.traversal{ result in
        values.append(result)
    }
    return values
}

//same way, we can handle for post & preorder traversal


var fstNode = TreeNode(10)
var scndNode = TreeNode(11)
var thirdNode = TreeNode(12)
fstNode.right = scndNode
scndNode.left = thirdNode

//INPUT: [10, 11, 12]
inorderTraversal(fstNode) //[10, 12, 11]
