import UIKit

var greeting = "Hello, playground"

class FirstVc: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegateFlowLayout {
    var customTableView: UITableView?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func get() {
        customTableView?.beginUpdates()
    }
    
    
}


protocol Color { }

extension Color {
    var color: String { return "Default color" }
}

class BlueBerry: Color {
    var color: String { return "Blue color" }
}

let berry = BlueBerry()
print("\(berry.color)")                 // prints "Blue color", as expected

let colorfulThing: Color = BlueBerry()
print("\(colorfulThing.color)") //"Default color"

protocol Vehicle {
}

extension Vehicle {
    func getVehicleName() {
        print("protocol extension")
    }
}

class Person: Vehicle {
    
    func getVehicleName() {
        print("audi")
    }
    
}

var p = Person()
p.getVehicleName()


let p1: Vehicle = Person()
p1.getVehicleName()

/*
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 A subarray is a contiguous part of an array.
 */
func maxSubArray(_ nums: [Int]) -> Int {

    var m = 0 //tracking of adding value of indexes
    var result = Int.min
    for i in 0..<nums.count {
        m = max(nums[i], nums[i] + m) // check current index value & sum of current index value + earlier
        result = max(result, m) // store max value from last result &&  latest summation value
    }

    return result

}

let nums = [-2,1,-3,4,-1,2,1,-5,4]
maxSubArray(nums) //6

let num2 = [5,4,-1,7,8]
maxSubArray(num2) //23
