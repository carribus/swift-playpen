//
//  main.swift
//  playpen
//
//  Created by Peter Mares on 20/01/2016.
//  Copyright © 2016 Peter Mares. All rights reserved.
//

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}

print (7.simpleDescription)
var  n: Int = 7;
n.adjust()
print (n.simpleDescription)


protocol AbsoluteProtocol {
    var absoluteValue: Double { get }
}

extension Double: AbsoluteProtocol {
    var absoluteValue: Double {
        get {
            return ( self < 0.0 ? -self : self)
        }
    }
}

var d: Double = -42
print("\(d)'s absolute value = \(d.absoluteValue)")