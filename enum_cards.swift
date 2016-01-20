//
//  main.swift
//  playpen
//
//  Created by Peter Mares on 20/01/2016.
//  Copyright © 2016 Peter Mares. All rights reserved.
//

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String {
        switch self {
        case    .Ace:
            return "ace"
        case    .Jack:
            return "jack"
        case    .Queen:
            return "queen"
        case    .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    
    func colour() -> String {
        switch self {
        case .Spades, .Clubs:
            return "black"
        case .Hearts, .Diamonds:
            return "red"
        }
    }
}

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }

    static func createDeck() -> [Card] {
        var deck: [Card] = []
        
        for s in [Suit.Spades, Suit.Hearts, Suit.Diamonds, Suit.Clubs] {
            for v in 1...13 {
                let r = Rank(rawValue: v)
                deck.append(Card(rank: r!, suit: s))
            }
        }
        
        return deck;
    }
}

func highestCard(card1: Rank, card2: Rank) -> Rank {
    let c1v = card1.rawValue
    let c2v = card2.rawValue
    
    return c1v > c2v ? card1 : card2
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue

print(ace)
print(aceRawValue)

let c1 = Rank.Ace, c2 = Rank.Queen
print("Highest card (\(c1) vs \(c2)) = \(highestCard(c1, card2: c2))")

if let convertedRank = Rank(rawValue: 10) {
    print("\(convertedRank) - \(convertedRank.simpleDescription())")
}

let suit = Suit.Clubs
let suit2: Suit = .Diamonds
print("\(suit) - \(suit.simpleDescription()): \(suit.colour())")
print("\(suit2) - \(suit2.simpleDescription()): \(suit2.colour())")

let threeOfSpades = Card(rank: .Three, suit: .Clubs)
print(threeOfSpades)
print(threeOfSpades.simpleDescription())

// construct the deck
let deck: [Card] = Card.createDeck()
var counter = 0
for card in deck {
    print("\(counter): \(card.rank) of \(card.suit)")
    counter += 1
}

