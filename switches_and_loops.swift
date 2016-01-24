//
//  playpen
//
//  Created by Peter Mares on 20/01/2016.
//  Copyright © 2016 Peter Mares. All rights reserved.
//

// switches and loops

let somePoint = (0, 0)

switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}

// using let
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with x value of \(x)")
case (0, let y):
    print("on the y-axis with y value of \(y)")
case let (x, y):
    print("somewhere else at \(x),\(y)")
}


// the where clause
let point2 = (1, -1)

switch point2 {
case let (x, y) where x == y:
    print("(\(x) is on the line x = y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y) is just some arb point")
}


// for loop
for var i = 0; i < 10; i++ {
    print("\(i)")
}

// another for loop
for i in 0..<10 {
    print("i = \(i)")
}

// labelled loops
print("Starting labelled loop")
var x = 0
mainloop: repeat {
    switch x {
    case 1, 2, 3:
        print("x <= 3")
    case 4, 5, 6:
        print("x > 3 && x <= 6")
    case 7:
        print("x = \(x)")
        x++
        continue mainloop
    case 8:
        break mainloop
    default:
        print("x = \(x)")
        
    }
    x++
} while (x < 10)
print("Labelled loop ended")