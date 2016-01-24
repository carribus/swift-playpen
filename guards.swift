//
//  playpen
//
//  Created by Peter Mares on 20/01/2016.
//  Copyright © 2016 Peter Mares. All rights reserved.
//

// guards

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello, \(name)")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location)")
}

greet(["name": "John"])
greet(["name": "Peter", "location": "Gibraltar"])