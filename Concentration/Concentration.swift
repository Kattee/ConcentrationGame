//
//  Concentration.swift
//  Concentration
//
//  Created by Katerina Temjanoska on 3/18/21.
//

import Foundation

class Concentration {
    
    //MARK: - Properties
    
    var cards: [Card] = []
    var indexOfOneAndOnlyFaceUpCard: Int?
    var flipCount = 0
    var score = 0
    var alreadyChosenCard: [Int] = []
    private var startTime = Date()
    private var endTime = Date()
    var numberOfCards = 0
    
    //MARK: - Concentration
    
    init(numberOfPairsOfCards: Int) {
        initialSetUp(numberOfPairsOfCards: numberOfPairsOfCards)
    }
    
    //MARK: - Public
    
    func chooseCard(at index: Int) {
        guard !cards[index].isMatched else { return }
        if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
            //check if cards match
            if cards[matchIndex].identifier == cards[index].identifier {
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
                score += 2
                numberOfCards += 2
                //time score
                endTime = Date()
                let timeInterval: Double = endTime.timeIntervalSince(startTime)
                if timeInterval < 2 {
                    score += 1
                }
            } else {
                for chosenIndentifier in alreadyChosenCard.indices {
                    if cards[index].identifier == alreadyChosenCard[chosenIndentifier] ||
                        cards[matchIndex].identifier == alreadyChosenCard[chosenIndentifier] {
                        score -= 1
                    }
                }
            }
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = nil
        } else {
            //either no cards or two cards are face up
            startTime = Date()
            for flipDownIndex in cards.indices {
                cards[flipDownIndex].isFaceUp = false
            }
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = index
        }
    }
    
    func shuffleCards() {
        cards.shuffle()
    }
    
    //MARK: - Private
    
    private func initialSetUp(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards
        {
            let card = Card()
            cards += [card, card]
        }
        shuffleCards()
    }
    
}
