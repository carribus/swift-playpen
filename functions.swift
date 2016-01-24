//
//  playpen
//
//  Created by Peter Mares on 20/01/2016.
//  Copyright © 2016 Peter Mares. All rights reserved.
//

// functions

// function that returns Void
// This could also be defined as:
// func sayHello(name: String) {...}
func sayHello(name: String) -> Void {
    print("Hello \(name)")
}

sayHello("Peter")


// multiple values returned
func getMinAndMax(numbers: [Int]) -> (min: Int, max: Int)? {
    if numbers.isEmpty { return nil }
    
    var _min = numbers[0], _max = numbers[0]
    
    for number in numbers {
        _min = number < _min ? number : _min;
        _max = number > _max ? number : _max;
    }
    
    return (min: _min, max: _max)
}

var minMax: (Int, Int)

if let minMax = getMinAndMax([5, 23, 12, 100, 343, 23, 12, 11, 5, -1, 1231, 232, 334, 56, 232, 56, 34, 87, 3]) {
//if let minMax = getMinAndMax([]) {
    print("Min: \(minMax.min), Max: \(minMax.max)")
} else {
    print("No min/max values could be found")
}

// default parameter values
func sayHelloAgain(name: String = "person") {
    print("Hello, \(name)")
}
sayHelloAgain();
sayHelloAgain("Crissy")


// variadic parameters
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0.0
    
    for number in numbers {
        total += number
    }
    
    return total / Double(numbers.count)
}
print(arithmeticMean(1, 2, 3, 4, 5, 6, 7, 8, 9, 10))


// in/out parameters
// (second parameter's external parameter name is _ so that we don't have to name the parameter when calling it)
func swapInts(inout a: Int, inout _ b: Int) {
    a ^= b;
    b ^= a;
    a ^= b;
}
var a = 5, b = 10
print("a = \(a), b = \(b)");
swapInts(&a, &b)
print("a = \(a), b = \(b)");


// function types
func add(a: Int, _ b: Int) -> Int {
    return a+b
}
func mult(a: Int, _ b: Int) -> Int {
    return a*b
}
func mathFunc(a: Int, _ b: Int, _ f: (Int, Int) -> Int) -> Int {
    return f(a, b)
}
print("Add 1 and 2 = \(mathFunc(1, 2, add))")
print("Multiple 1 and 2 = \(mathFunc(1, 2, mult))")


// functions are return types
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    return backwards ? stepBackward : stepForward
}

var currentValue = 4
while currentValue != 0 {
    print(currentValue)
    // chooseStepFunction returns a function of type (Int) -> (Int) so we call it directly
    currentValue = chooseStepFunction(currentValue > 0)(currentValue)
}
print("zero")


