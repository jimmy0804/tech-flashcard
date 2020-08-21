//
//  FlashCardPage.swift
//  FlashCard
//
//  Created by Jimmy Yeung on 20/8/2020.
//

import SwiftUI

struct FlashCardPage: View {
    private var fakeCards: [Card] = (0..<100).map { .init(question: "question \($0)", answer: "answer \($0)") }

    var body: some View {
        FlashCardStack(viewModel: CardStackViewModel(cards: fakeCards))
            .frame(width: 300, height: 500, alignment: .center)
    }
}

struct FlashCardStack: View {
    @ObservedObject private var viewModel: CardStackViewModel
    @State private var isDragging = false

    init(viewModel: CardStackViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            ForEach(viewModel.cardHolders) { cardHolder in
                FlashCardView() {
                    Text(cardHolder.frontContent)
                } backContent: {
                    Text(cardHolder.backContent)
                }
                .rotationEffect(cardHolder.rotationDegrees)
                .animation(.easeIn(duration: 0.1))
                .modifier(drag)
            }
        }
        .onAppear {
            viewModel.addCardsToCardHolders()
        }
    }
    
    private var drag: some ViewModifier {
        DraggableCard(isDragging: $isDragging, completion: { action in
            switch action {
            case .draggedToLeft(let duration):
                viewModel.removeFrontCardAndRefillIfNeeded(with: duration)
            case .draggedToRight(let duration):
                viewModel.removeFrontCardAndRefillIfNeeded(with: duration)
            case .none:
                break
            }
        })
    }
}

struct FlashCardPage_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardPage()
    }
}
