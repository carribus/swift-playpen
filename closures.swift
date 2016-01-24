//
//  playpen
//
//  Created by Peter Mares on 20/01/2016.
//  Copyright © 2016 Peter Mares. All rights reserved.
//

// closures

var names = ["Chris", "Karen", "Cristina", "Peter", "Carlos", "Dennis", "Ashley"]

print(names)
// reverse (long form)
names = names.sort({ (a: String, b: String) -> Bool in a > b })
print(names)
// reverse (short form)
names = names.sort({ a, b in a > b })
print(names)
// reverse (REALLY short form)
names = names.sort({ $0 > $1 })
print(names)
// reverse (REALLY REALLY short form)
// in thise case, we are actually passing the operator function > which so happens to take 
// 2 parameters (Strings in this case) and returns a bool - a perfect match for what .sort is expecting
names = names.sort(>)
print(names)

// foreach (long form)
names.forEach({ (name: String) in print("lf - \(name)") })
// foreach (short form)
names.forEach({ name in print("sf - \(name)") })
// foreach (REALLY short form)
names.forEach({ print("sf - \($0)") })


// trailing closures
names.forEach() {
    name in
    if let firstChar: Character? = name[name.characters.startIndex] where firstChar == "A" || firstChar >= "M" {
        print(name.uppercaseString)
    } else {
        print(name)
    }
}


// capturing values
func makeIncrementer(forIncrement amount: Int, startValue: Int = 0) -> (() -> Int) {
    var runningTotal = startValue
    
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    return incrementer
}
var incBy2 = makeIncrementer(forIncrement: 2, startValue: 20);
var incBy3 = makeIncrementer(forIncrement: 3);
for i in 0...4 {
    print("by2: \(incBy2())")
}
for i in 0...4 {
    print("by3: \(incBy3())")
}

// Nonescaping closures
// A closure that is 'potentially' escaping means that the closure can be called outside of the scope of the function into which it is passed.
// In the case of a @noescape closure, the closure is executed within the scope and lifetime of the function that it is passed into (not after the function has ended)
var completionHandlers: [()->Void] = [];

func someFuncWithNoescapeClosure(@noescape closure: ()->Void) {
    closure()
}

func someFuncWithEscapingClosure(completionHandler:()->Void) {
    completionHandlers.append(completionHandler)
    print("\(completionHandlers.count) closure(s) contained")
}

someFuncWithNoescapeClosure({print("No escaping this")})
someFuncWithEscapingClosure({print("Escaping..")})
someFuncWithEscapingClosure({print("Another failed escape attempt..")})

completionHandlers.forEach({f in f()})


// Autoclosures
var customersInLine = ["Chris", "Peter", "Carlos", "Cristina", "Jan"]
func serveCustomer(@autoclosure customerProvider: ()->String) {
    print("Now serving \(customerProvider())");
}
while ( customersInLine.count > 0 ) {
    serveCustomer(customersInLine.removeAtIndex(0));
}


