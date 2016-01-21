//
//  main.swift
//  playpen
//
//  Created by Peter Mares on 20/01/2016.
//  Copyright © 2016 Peter Mares. All rights reserved.
//

// Tuples

func getHttpResult(code: Int, message: String) -> (Int, String, String) {
    return (code, message, "Value to be ignored")
}

func getNamedHttpResult(code: Int, message: String) -> (statusCode: Int, message: String, uselessValue: String) {
    return (statusCode: code, message: message, uselessValue: "Value to be ignored")
}

var result = getHttpResult(404, message: "Not Found")
print(result)

// decompose/destucture (using _ to ignore the ignorable third value in the tuple)
let (statusCode, message, _) = result;
print("statusCode: \(statusCode)")
print("message: \(message)")


// access via index
print("result.0 = \(result.0)")
print("result.1 = \(result.1)")
print("result.2 = \(result.2)")

// access via name
var result2 = getNamedHttpResult(500, message: "Server Error")
print("result2.statusCode = \(result2.statusCode)")
print("result2.message = \(result2.message)")
print("result2.uselessValue = \(result2.uselessValue)")



