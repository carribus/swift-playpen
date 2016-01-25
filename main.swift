//
//  playpen
//
//  Created by Peter Mares on 20/01/2016.
//  Copyright © 2016 Peter Mares. All rights reserved.
//

// Properties

struct Point {
    var x = 0.0
    var y = 0.0
    
    // the 'mutating' keyword below allows the immutable structure's method to mutate the underlying properties
    // of the structure. This is done because structures (and enumerations) are value types and are, by default,
    // immutable
    mutating func moveBy(x: Double, _ y: Double) {
        self.x += x
        self.y += y
    }
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    // calculated property
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set /*(newCenter)*/ {
//            origin.x = newCenter.x - (size.width / 2)
//            origin.y = newCenter.y - (size.height / 2)
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is not at \(square.origin.x), \(square.origin.y)")


// read only properties
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("Cuboid volume = \(fourByFiveByTwo.volume)")


// Property Observers
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

// global property observer
let stepCounter = StepCounter()
var stepCountDoubled: Int {
    return stepCounter.totalSteps*2
}
stepCounter.totalSteps = 200
print("stepCountDoubled = \(stepCountDoubled)")
stepCounter.totalSteps = 360
print("stepCountDoubled = \(stepCountDoubled)")
stepCounter.totalSteps = 896
print("stepCountDoubled = \(stepCountDoubled)")


class Base {
    static var value: Int = 0
    var instanceValue: Int = 0
    
    // this static method will not be able to be overridden because the 'static' keyword was used
    static func decValue(decBy: Int) -> Int {
        value -= decBy
        return value
    }
    
    // this static method is overridable since the 'class' keyword was used
    class func incValue(incBy: Int) -> Int {
        value += incBy
        return value
    }
    
    func incInstanceValue(incBy: Int) -> Int {
        instanceValue += incBy
        return instanceValue
    }
}

class Subclass: Base {
    override class func incValue(incBy: Int) -> Int {
        super.incValue(-incBy)
        return value
    }
}

var b = Base()
var s = Subclass()

print("Base.value = \(Base.value)")
print("Subclass.value = \(Subclass.value)")
Subclass.incValue(2)
print("Base.value = \(Base.value)")
print("Subclass.value = \(Subclass.value)")
Base.incValue(2)
print("Base.value = \(Base.value)")
print("Subclass.value = \(Subclass.value)")



