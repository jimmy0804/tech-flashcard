//
//  CreateCardSetsPageViewModel.swift
//  FlashCard
//
//  Created by Jimmy, Yeung on 13/8/2020.
//

import SwiftUI
import Combine

final class CreateCardSetsPageViewModel: ObservableObject {
    enum Mode {
        case createNew
        case edit(CardSet)
    }

    @Published var icon = "number.circle.fill"
    @Published var themeColor = Color.purple
    @Published var title = ""
    @Published var cards = [Card]()
    
    @Published var isValidToSave = false

    private let mode: Mode
    private var cancellableSet = Set<AnyCancellable>()
    
    init(mode: Mode = .createNew) {
        self.mode = mode
        handleMode()
        startValidateAllFields()
    }
    
    func makeCardSet() -> CardSet {
        switch mode {
        case .createNew:
            return .init(icon: icon, title: title, themeColor: themeColor, cards: cards)
        case .edit(let oldCardSet):
            return .init(id: oldCardSet.id, icon: icon, title: title, themeColor: themeColor, cards: cards)
        }
    }
    
    private func handleMode() {
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
                return !icon.isEmpty && !title.isEmpty // && cards.count > 0
            }
            .assign(to: \.isValidToSave, on: self)
            .store(in: &cancellableSet)
    }
}
