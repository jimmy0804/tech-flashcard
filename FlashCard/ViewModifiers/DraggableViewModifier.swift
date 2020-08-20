//
//  DraggableViewModifier.swift
//  FlashCard
//
//  Created by Jimmy Yeung on 20/8/2020.
//

import SwiftUI

struct DraggableCard: ViewModifier {
    enum Action {
        case draggedToLeft
        case draggedToRight
        case none
    }

    @State private var dragGeatureOffset: CGSize = .zero
    private var originalOffset: CGSize = .zero
    
    private let completion: (Action) -> Void
    
    init(completion: @escaping (Action) -> Void) {
        self.completion = completion
    }
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(Double(dragGeatureOffset.width) / 10))
            .offset(dragGeatureOffset)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        dragGeatureOffset = value.translation

                    })
                    .onEnded({ value in
                        withAnimation {
                            dragGeatureOffset = .zero
                        }
                    })
            )
    }
}
