//
//  playpen
//
//  Created by Peter Mares on 20/01/2016.
//  Copyright © 2016 Peter Mares. All rights reserved.
//

// ARC (Automatic Reference Counting)

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialised")
    }
    
    deinit {
        print("\(name) is being deinitialised")
    }
}

var ref1: Person? {
    willSet {
        print("About to set Person1 to \(newValue)")
    }
}
var ref2: Person? {
    willSet {
        print("About to set Person2 to \(newValue)")
    }
}
var ref3: Person? {
    willSet {
        print("About to set Person3 to \(newValue)")
    }
}

ref1 = Person(name: "Peter")
ref2 = ref1
ref3 = ref1

ref1 = nil
ref2 = nil
ref3 = nil


//
// weak references
class Person2 {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialised") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person2?
    deinit { print("Apartment \(unit) is being deinitialised") }
}

var john: Person2?
var unit4a: Apartment?

john = Person2(name: "John appleseed")
unit4a = Apartment(unit: "4A")

john!.apartment = unit4a
unit4a!.tenant = john

print("Before setting john to nil")
print("Unit 4A's tenant is \(unit4a?.tenant?.name)")
john = nil
print("Unit 4A's tenant is \(unit4a?.tenant?.name)")