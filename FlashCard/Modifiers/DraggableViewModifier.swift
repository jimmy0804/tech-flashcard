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
    private let draggedToActionThreshold: CGFloat = 100.0
    private let slideOutDistance: CGFloat = 1500.0
    
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
                        let endDragGestureOffset = dragGeatureOffset
                        let isDraggedToRight = value.translation.width > draggedToActionThreshold || value.predictedEndTranslation.width > draggedToActionThreshold
                        let isDraggedToLeft = value.translation.width < -draggedToActionThreshold || value.predictedEndTranslation.width < -draggedToActionThreshold
                        var endOffset: CGSize = .zero

                        if isDraggedToRight {
                            endOffset = .init(width: slideOutDistance, height: endDragGestureOffset.height)
                            completion(.draggedToRight)
                        } else if isDraggedToLeft {
                            endOffset = .init(width: -slideOutDistance, height: endDragGestureOffset.height)
                            completion(.draggedToLeft)
                        } else {
                            completion(.none)
                        }
                        
                        withAnimation {
                            dragGeatureOffset = endOffset
                        }
                    })
            )
    }
}
