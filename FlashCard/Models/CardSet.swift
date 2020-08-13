//
//  CardSet.swift
//  FlashCard
//
//  Created by Jimmy, Yeung on 13/8/2020.
//

import Foundation
import SwiftUI

struct CardSet {
    let id = UUID()
    var icon: String
    var title: String
    var themeColor: Color
    var cards: [Card]
}

struct Card {
    var question: String
    var answer: String
}

extension CardSet: Equatable {}
extension Card: Equatable {}
