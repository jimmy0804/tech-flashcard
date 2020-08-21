//
//  CardStackViewModel.swift
//  FlashCard
//
//  Created by Jimmy Yeung on 22/8/2020.
//

import SwiftUI

final class CardStackViewModel: ObservableObject {
    @Published var cardHolders = [CardHolder]()
    private var cards = [Card]()

    init(cards: [Card]) {
        self.cards = cards
    }
    
    func addCardsToCardHolders() {
        let maxCardHolders = 4
        let insertedCardToHolders = cards.prefix(maxCardHolders).reversed().enumerated().map {
            CardHolder(card: $1, isFront: $0 == maxCardHolders - 1)
        }
        cardHolders.append(contentsOf: insertedCardToHolders)
        cards.removeFirst(maxCardHolders)
    }
    
    // remove card and it's holder -> check has card left
    // if yes -> append new card to the start of card holder
    // if no -> do nothing
    func removeFrontCardAndRefillIfNeeded(with delay: TimeInterval) {
        cardHolders[cardHolders.count - 2].bringToFront()

        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.cardHolders.removeLast()

            if self.cards.count > 0 {
                let card = self.cards.removeFirst()
                self.cardHolders.insert(.init(card: card, isFront: false), at: 0)
            }
        }
    }
}
