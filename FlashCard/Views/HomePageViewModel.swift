//
//  HomePageViewModel.swift
//  FlashCard
//
//  Created by Jimmy, Yeung on 13/8/2020.
//

import Foundation

final class HomePageViewModel: ObservableObject {
    @Published var cardSets: [CardSet]
    
    private var pendingUpdateCardSet: CardSet?
    
    init(cardSets: [CardSet]) {
        self.cardSets = cardSets
    }
    
    func addPendingUpdate(cardSet: CardSet) {
        pendingUpdateCardSet = cardSet
    }
    
    func processPendingUpdates() {
        guard let pendingUpdateCardSet = pendingUpdateCardSet else { return }
        updateOrInsert(cardSet: pendingUpdateCardSet)
    }
    
    private func updateOrInsert(cardSet: CardSet) {
        if let index = cardSets.firstIndex(of: cardSet) {
            cardSets[index] = cardSet
        } else {
            cardSets.append(cardSet)
        }
    }
}
