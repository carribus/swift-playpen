//
//  playpen
//
//  Created by Peter Mares on 20/01/2016.
//  Copyright © 2016 Peter Mares. All rights reserved.
//

// classes and structures

struct Point {
    var x = 0
    var y = 0
}

class CPoint {
    var x = 0
    var y = 0
}

var pt1 = Point(x: 1, y: 1)
var pt2 = CPoint()

var pt3 = pt1;

pt1.x = 10
pt3.y = 10
print(pt1)
print(pt3)

var pt4 = pt2;

pt2.x = 20
pt4.y = 10
print("\(pt2.x), \(pt2.y)")
print("\(pt4.x), \(pt4.y)")

struct PointDupe {
    var name = ""
    var point = CPoint()
}

var pd1 = PointDupe()
var pd2: PointDupe

pd1.name = "pd1"
pd2 = pd1
pd2.name = "pd2"
pd1.point.x = 10

print("\(pd1.name): x=\(pd1.point.x), y=\(pd1.point.y)")
print("\(pd2.name): x=\(pd2.point.x), y=\(pd2.point.y)")


// Identity operators (=== and ==!)
if ( pd1.point === pd2.point ) {
    print("pd1.point === pd2.point")
}

pd1.point = CPoint()
if ( pd1.point === pd2.point ) {
    print("pd1.point === pd2.point")
} else {
    print("pd1.point !== pd2.point")
}

