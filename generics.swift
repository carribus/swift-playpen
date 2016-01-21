//
//  main.swift
//  playpen
//
//  Created by Peter Mares on 20/01/2016.
//  Copyright © 2016 Peter Mares. All rights reserved.
//

func repeatItem<Item>(item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

var items = repeatItem("knock", numberOfTimes: 4)
print(items)
print(items.count)

enum OptionalValue<Wrapped> {
    case    None
    case    Some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .None
print(possibleInteger)
possibleInteger = .Some(100)
print(possibleInteger)



