//
//  playpen
//
//  Created by Peter Mares on 20/01/2016.
//  Copyright © 2016 Peter Mares. All rights reserved.
//

// arrays

let threeDoubles = [Double](count: 4, repeatedValue: 42.0)
print(threeDoubles)

let threeMoreDoubles = [Double](count: 3, repeatedValue: 21.0)
print(threeMoreDoubles)

// array concatenation
let combinedDoubles = threeDoubles + threeMoreDoubles
print(combinedDoubles)

// array appending
var shoppingList = ["Milk", "Eggs"]
print("Shopping List 1: \(shoppingList)")
shoppingList += ["Bread"]
print("Shopping List 2: \(shoppingList)")

// array modification
shoppingList[0] = "Organic Milk";
print("Modified Shopping List: \(shoppingList)")

func buyItem(index: Int, list: [String]) -> String {
    return list[index] + " [BOUGHT]"
}

// array iteration
for (index, value) in shoppingList.enumerate() {
    print("[\(index)] \(value)")
    shoppingList[index] = buyItem(index, list: shoppingList)
}
print(shoppingList)

