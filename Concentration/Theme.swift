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
            return ["π¦","π±","π","π","π»","π","π­","π¬","π€","π€‘"]
        case .animals:
            return ["πΆ","π¬","π","π","π’","π","π¦’","π¦", "π©","π¦"]
        case .faces:
            return ["π","βΊοΈ","π","π€¨","π","π","π","π΄","π₯³","π€«"]
        case .sports:
            return ["πΎ","π","β½οΈ","π","π","πββοΈ","π§ββοΈ","π₯","π","β·"]
        case .food:
            return ["π","π₯","π","π","π₯ͺ","π§","π","π", "π―","π₯©"]
        case .cars:
            return ["π","π","π","π","πΊ","π","π","π", "π","π"]
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
