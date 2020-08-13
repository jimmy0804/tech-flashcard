//
//  CardSet.swift
//  FlashCard
//
//  Created by Jimmy, Yeung on 13/8/2020.
//

import Foundation
import SwiftUI

struct CardSet {
    let id: UUID
    var icon: String
    var title: String
    var themeColor: Color
    var cards: [Card]
    
    init(id: UUID = UUID(),
         icon: String,
         title: String,
         themeColor: Color,
         cards: [Card]) {
        self.id = id
        self.icon = icon
        self.title = title
        self.themeColor = themeColor
        self.cards = cards
    }
}

struct Card {
    var question: String
    var answer: String
}

extension CardSet: Equatable {}
extension Card: Equatable {}
