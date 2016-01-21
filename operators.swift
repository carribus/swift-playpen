//
//  main.swift
//  playpen
//
//  Created by Peter Mares on 20/01/2016.
//  Copyright © 2016 Peter Mares. All rights reserved.
//

// operators

var i = 1

print("(i+1) = \(i+1)")
print("i = \(i)")

print("(i += 1) = \((i+=1))")
print("i = \(i)")

let str = "hello"
if str == "hello" { print("str == hello") }
if str != "Hello" { print("str != Hello") }

func compareHeightToPeter(height: Int) {
    print("At a height of \(height)cm, you are \(height < 193 ? "not " : "")taller than Peter")
}

for height in 190...195 {
    compareHeightToPeter(height)
}

// Nil coalescing operator (??)
let defaultColour = "red"
var userDefinedColourName: String?
var colorNameToUse = userDefinedColourName ?? defaultColour
print(colorNameToUse)
userDefinedColourName = "green"
colorNameToUse = userDefinedColourName ?? defaultColour
print(colorNameToUse)