//
//  playpen
//
//  Created by Peter Mares on 20/01/2016.
//  Copyright © 2016 Peter Mares. All rights reserved.
//

// enumerations

enum CompassPoint {
    case    North, South, East, West
}

var pointingTowards = CompassPoint.North
pointingTowards = .East
pointingTowards = .South
pointingTowards = .West

// associated values
enum BarCode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

func printBarCode(code: BarCode) {
    switch code {
    case .UPCA(let numberSystem, let manufacturer, let product, let check):
        print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check)")
    case .QRCode(let productCode):
        print("QR code: \(productCode)")
    }
}

var productBarCode = BarCode.UPCA(8, 85909, 51226, 3)

printBarCode(productBarCode)
productBarCode = .QRCode("12345678900987654321")
printBarCode(productBarCode)


// raw values
enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

let possiblePlanet = Planet(rawValue: 7)
let impossiblePlanet = Planet(rawValue: 11)

print(possiblePlanet)
print(impossiblePlanet)


// recursive enumerations
enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
        
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
        
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
        
    }
}

print( evaluate(.Multiplication(.Number(5), .Addition( .Number(1), .Number(2)))) )

