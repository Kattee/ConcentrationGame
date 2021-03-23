//
//  Theme.swift
//  Concentration
//
//  Created by Katerina Temjanoska on 3/18/21.
//

import UIKit

enum Theme: CaseIterable {
    
    case hallowen
    case animals
    case faces
    case sports
    case food
    case cars
    
    var icons: [String] {
        switch self {
        case .hallowen:
            return ["🦇","😱","🙀","😈","👻","🎃","🍭","🍬","🤖","🤡"]
        case .animals:
            return ["🐶","🐬","🙈","🐙","🐢","🐅","🦢","🦜", "🐩","🦘"]
        case .faces:
            return ["😁","☺️","😂","🤨","😎","🙄","😜","😴","🥳","🤫"]
        case .sports:
            return ["🎾","🏀","⚽️","🏓","🏒","🏄‍♀️","🧗‍♀️","🥊","🏈","⛷"]
        case .food:
            return ["🍏","🥝","🍔","🍕","🥪","🧁","🍞","🍉", "🌯","🥩"]
        case .cars:
            return ["🚗","🚓","🚒","🚛","🛺","🏎","🏍","🚜", "🚕","🚌"]
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .hallowen:
            return .black
        case .animals:
            return .gray
        case .faces:
            return .red
        case .sports:
            return .cyan
        case .food:
            return .darkGray
        case .cars:
            return .systemGray
        }
    }
    
    var cardColor: UIColor {
        switch self {
        case .hallowen:
            return .orange
        case .animals:
            return .blue
        case .faces:
            return .lightGray
        case .sports:
            return .blue
        case .food:
            return .systemPink
        case .cars:
            return .magenta
        }
    }
    
}
