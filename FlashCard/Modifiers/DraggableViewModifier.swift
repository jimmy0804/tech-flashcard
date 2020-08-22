//
//  DraggableViewModifier.swift
//  FlashCard
//
//  Created by Jimmy Yeung on 20/8/2020.
//

import SwiftUI

struct DraggableCard: ViewModifier {
    enum Action {
        case draggedToLeft(duration: TimeInterval)
        case draggedToRight(duration: TimeInterval)
        case none
    }

    @State private var lastDragOffset: CGSize = .zero
    @State private var lastDragValue: DragGesture.Value?
    @Binding var isDragging: Bool

    private let isDragAllowed: Bool
    private let draggedToActionThreshold: CGFloat = 120.0
    private let slideOutDistance: CGFloat = 1500.0
    private let animationDuration: TimeInterval = 0.3
    
    private var rotationDegrees: Angle {
        .degrees(Double(lastDragOffset.width) / 10)
    }
    
    private let completion: (Action) -> Void
    
    init(isDragAllowed: Bool,
         isDragging: Binding<Bool>,
         completion: @escaping (Action) -> Void) {
        self.isDragAllowed = isDragAllowed
        self._isDragging = isDragging
        self.completion = completion
    }
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(rotationDegrees)
            .offset(lastDragOffset)
            .gesture(
                DragGesture(minimumDistance: 0.0)
                    .onChanged({ value in
                        guard isDragAllowed else { return }
                        lastDragOffset = value.translation
                        lastDragValue = value
                        isDragging = true
                        print(lastDragOffset)
                    })
                    .onEnded({ value in
//                        guard let lastDragValue = lastDragValue else { return }
                        let isDraggedToRight = value.translation.width > draggedToActionThreshold || value.predictedEndTranslation.width > draggedToActionThreshold
                        let isDraggedToLeft = value.translation.width < -draggedToActionThreshold || value.predictedEndTranslation.width < -draggedToActionThreshold
                        var endOffset: CGSize = .zero
//                        var dragTimeDifferent = value.time.timeIntervalSince(lastDragValue.time)
//                        var speed = Double(value.translation.width) / dragTimeDifferent
                        
                        var pendingAction = Action.none
                        if isDraggedToRight {
                            endOffset = .init(width: slideOutDistance, height: lastDragOffset.height)
                            pendingAction = .draggedToRight(duration: animationDuration)
                        } else if isDraggedToLeft {
                            endOffset = .init(width: -slideOutDistance, height: lastDragOffset.height)
                            pendingAction = .draggedToLeft(duration: animationDuration)
                        }
                        
                        withAnimation(Animation.easeIn(duration: animationDuration)) {
                            lastDragOffset = endOffset
                        }
                        
                        isDragging = false
                        completion(pendingAction)
                    })
            )
    }
}
