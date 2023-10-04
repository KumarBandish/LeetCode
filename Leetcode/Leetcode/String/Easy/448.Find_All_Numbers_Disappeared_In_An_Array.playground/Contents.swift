 import UIKit

 var str = "Hello, playground"


 func findAllDisapperanceNumber(_ nums: [Int]) -> [Int] {
     var nums1 = nums
     
     for i in 0..<nums1.count {
         let n = abs(nums1[i])
         if nums1[n - 1] >= 0 {
             nums1[n - 1] = -nums1[n - 1]
         }
     }
     
     var misssing = [Int]()
     for i in 0..<nums1.count {
         if nums1[i] >= 0 {
             misssing.append(i + 1)
         }
     }
    
     return misssing
 }

 let nums = [4,3,2,7,8,2,3,1]
 findAllDisapperanceNumber(nums)

