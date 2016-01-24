//
//  playpen
//
//  Created by Peter Mares on 20/01/2016.
//  Copyright © 2016 Peter Mares. All rights reserved.
//

// sets

var letters = Set<Character>()

print("letters is of type Set<Character> with \(letters.count) items")

// try and add duplicate elements into the set
for i in 1...3 {
    letters.insert("a")
}
print("letters is of type Set<Character> with \(letters.count) items")

// set from array
var musicGenres: Set<String> = ["Rock", "Dubstep", "Hip Hop", "Rock"]   // the last element should/will be ignored
print(musicGenres)

// reduced declaration
var musicGenres2: Set = ["House", "D&B", "Country"]
print(musicGenres2)

// set operations
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

print(oddDigits.union(evenDigits).sort())
print(oddDigits.intersect(evenDigits).sort())
print(oddDigits.subtract(singleDigitPrimeNumbers).sort())
print(oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort())

// set membership and equality
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

print("isSubsetOf: \(houseAnimals.isSubsetOf(farmAnimals))")
print("isSupersetOf: \(farmAnimals.isSupersetOf(houseAnimals))")
print("isDisjointWith: \(farmAnimals.isDisjointWith(cityAnimals))")


