//
//  CreateCardSetsPageViewModel.swift
//  FlashCard
//
//  Created by Yeung, Jimmy(AWF) on 13/8/2020.
//

import SwiftUI
import Combine

final class CreateCardSetsPageViewModel: ObservableObject {
    enum Mode {
        case createNew
        case edit(CardSet)
    }

    @Published var icon = ""
    @Published var themeColor = Color.purple
    @Published var title = ""
    @Published var cards = [Card]()
    
    @Published var isValidToSave = false

    private var cancellableSet = Set<AnyCancellable>()
    
    init(mode: Mode = .createNew) {
        handleMode(mode)
        startValidateAllFields()
    }
    
    func makeCardSet() -> CardSet {
        .init(icon: icon, title: title, themeColor: themeColor, cards: cards)
    }
    
    private func handleMode(_ mode: Mode) {
        switch mode {
        case .createNew:
            break
        case .edit(let cardSet):
            prepopulateCardSet(cardSet)
        }
    }
    
    private func prepopulateCardSet(_ cardSet: CardSet) {
        icon = cardSet.icon
        themeColor = cardSet.themeColor
        title = cardSet.title
        cards = cardSet.cards
    }
    
    private func startValidateAllFields() {
        Publishers.CombineLatest3($icon, $title, $cards)
            .map { icon, title, cards in
                return !icon.isEmpty && !title.isEmpty && cards.count > 0
            }
            .assign(to: \.isValidToSave, on: self)
            .store(in: &cancellableSet)
    }
}
