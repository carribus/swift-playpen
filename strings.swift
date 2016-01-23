//
//  playpen
//
//  Created by Peter Mares on 20/01/2016.
//  Copyright © 2016 Peter Mares. All rights reserved.
//

// strings

func useOptionalString(str: String?) {
    if let s = str {
        print("String passed = \(s)")
    } else {
        print("nil string passed")
    }
}

var realstr = "Hello world"

// implicit wrapping
useOptionalString(realstr)

// looping through characters of a string
for c in realstr.characters {
    print(c)
}

// constructing strings from character array
let bang: Character = "!"
let helloChars: [Character] = ["h", "e", "l", "l", "o", bang]
let helloStr = String(helloChars)
print(helloStr)

// Unicode symbols
let babyChic = "\u{1F425}"
print(babyChic)

// unicode string (and diff in counts)
let cafestr = "cafe\u{301}"
print("string = \(cafestr)")
print("string.characters.count = \(cafestr.characters.count)")
print("string.utf8.count = \(cafestr.utf8.count)")
print("string.utf16.count = \(cafestr.utf16.count)")

