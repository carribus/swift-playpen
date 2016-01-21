//
//  main.swift
//  playpen
//
//  Created by Peter Mares on 20/01/2016.
//  Copyright © 2016 Peter Mares. All rights reserved.
//

// OptionalValues

let possibleNumber = "123"
var convertedNumber = Int(possibleNumber)
print(convertedNumber)

convertedNumber = Int("a123")
print(convertedNumber)

var serverResponseCode: Int? = 404
print(serverResponseCode)

serverResponseCode = Int("405")
print(serverResponseCode)

serverResponseCode = Int("hello")
print(serverResponseCode)

serverResponseCode = nil
print(serverResponseCode)

var maybeString: String?

if maybeString == nil {
    print(maybeString)
    maybeString = "Hello, world"
    print(maybeString!)
    maybeString = String(123)
    print(maybeString!)
} else {
    print("Optional maybeString initialied to a value that is not nil")
}


print("--Optional Binding--");

var stringArray: [String?] = ["A string", nil, "Another string"]

for i in 0..<stringArray.count {
    if let strVal = stringArray[i] {
        // no need to use ! to force unwrap strVal, since it is already initialised to the value in the optional string element
        print("strVal = \(strVal)")
    } else {
        print("strVal is nil")
    }
}

// use a where clause to check if both strings are valid values
if let str1: String? = stringArray[0], str2: String? = stringArray[1] where str1 != nil && str2 != nil {
    print("str1 and str2 are strings \(str1), \(str2)")
} else {
    print("str1 or str2 are not string values!")
}

if let str1: String? = stringArray[0], str3: String? = stringArray[2] where str1 != nil && str3 != nil {
    print("str1 and str3 are strings \(str1), \(str3)")
} else {
    print("str1 or str3 are not string values!")
}

print("Implicit unwrapping")

let possibleString1: String? = "An optional string"
let forcedString1: String = possibleString1!

let assumedString: String! = "An implicity unwrapped optional string"
let implicitString: String = assumedString
