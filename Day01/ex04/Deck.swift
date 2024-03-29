
import Foundation

extension Array {
    mutating func shuffleArr() {
        let size: Int = self.count
        for i in 0...size - 1 {
            let j = Int(arc4random_uniform(UInt32(size - 1)))
            if i != j {
                self.swapAt(i, j)
            }
        }
    }
}

class Deck: NSObject {
    static let allSpades: [Card] = Value.allValues.map({Card(color: Color.Spades, value: $0)})
    static let allDiamonds: [Card] = Value.allValues.map({Card(color: Color.Diamonds, value: $0)})
    static let allHearts: [Card] = Value.allValues.map({Card(color: Color.Hearts, value: $0)})
    static let allClubs: [Card] = Value.allValues.map({Card(color: Color.Clubs, value: $0)})
    static let allCards: [Card] = allSpades + allDiamonds + allHearts + allClubs
    
    var cards: [Card]
    var discards: [Card]
    var outs: [Card]
    
    init(sorted: Bool) {
        self.cards = Deck.allCards
        self.discards = []
        self.outs = []
        if !sorted {
            self.cards.shuffleArr()
        }
    }
    
    override public var description: String {
        return self.cards.description
    }
    
    func draw () -> Card? {
        var firstCard: Card?
        firstCard = self.cards.first
        self.outs.append(firstCard!)
        self.cards.remove(at:0)
        return firstCard
    }
    
    func fold (c: Card) {
        var index = 0
        for elem in self.outs {
            if c == elem {
                self.discards.append(elem)
                self.outs.remove(at:index)
            }
            index = index + 1
        }
    }
}
