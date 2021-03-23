//
//  Card.swift
//  Concentration
//
//  Created by Katerina Temjanoska on 3/18/21.
//

import Foundation

struct Card {
    
    //MARK: - Properties
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    private static var identifierFactory = 0
    
    //MARK: - Card
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    //MARK: - Private
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
}
