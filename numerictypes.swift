//
//  main.swift
//  playpen
//
//  Created by Peter Mares on 20/01/2016.
//  Copyright © 2016 Peter Mares. All rights reserved.
//

typealias uint16 = UInt16;

let ui16: UInt16 = 22;
var ui8: UInt8 = 22;

// this fails due to incompatible types
//let result = ui16 + ui8;

var result16 = ui16 + UInt16(ui8)
var result8 = UInt8(ui16) + ui8;

print("UInt16 result: \(result16)")
print("UInt8 result: \(result8)")


print("Using typealias uint16 (aliasing UInt16)")
let ui16_2: uint16 = 2323
result16 = ui16 + ui16_2
print(result16)

print("Setting ui8 = 235");
ui8 = 235;

print("About to cause a EXC_BAD_INSTRUCTION error by overflowing a UInt8 variable with 235+22 (>255)")
result8 = ui8 + UInt8(ui16)
