//
//  CardSetListItemViewModel.swift
//  FlashCard
//
//  Created by Jimmy, Yeung on 13/8/2020.
//

import SwiftUI

struct CardSetListItemViewModel  {
    var id: UUID {
        cardSet.id
    }

    var systemImageName: String {
        cardSet.icon
    }

    var systemImageColor: Color {
        cardSet.themeColor
    }

    var title: String {
        cardSet.title
    }

    var subtitle: String {
        "\(cardSet.cards.count) cards"
    }
    
    let cardSet: CardSet
    
    init(cardSet: CardSet) {
        self.cardSet = cardSet
    }
}

extension CardSetListItemViewModel: Identifiable {}
