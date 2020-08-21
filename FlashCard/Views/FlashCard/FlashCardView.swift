//
//  FlashCardView.swift
//  FlashCard
//
//  Created by Jimmy Yeung on 20/8/2020.
//

import SwiftUI

struct FlashCardView<Content>: View where Content: View {
    @State private var isFlipped = false
    @State private var isZIndexFlipped = false
    
    private let flipAnimationDuration: TimeInterval = 0.3
    private let cornerRadius: CGFloat = 4.0
    
    let frontContent: () -> Content
    let backContent: () -> Content
    
    init(@ViewBuilder frontContent: @escaping () -> Content,
        @ViewBuilder backContent:  @escaping () -> Content) {
        self.frontContent = frontContent
        self.backContent = backContent
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(Color.pink)
                .overlay(frontContent())
                .rotation3DEffect(
                    isFlipped ? .degrees(180.0) : .zero,
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                .animation(Animation.easeIn(duration: flipAnimationDuration))
                .zIndex(isZIndexFlipped ? 0 : 1)
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(Color.pink)
                .overlay(backContent())
                .rotation3DEffect(
                    isFlipped ? .zero : .degrees(180.0),
                    axis: (x: 0.0, y: -1.0, z: 0.0)
                )
                .animation(Animation.easeIn(duration: flipAnimationDuration))
                .zIndex(isZIndexFlipped ? 1 : 0)
        }
        .shadow(radius: 4.0)
        .contentShape(RoundedRectangle(cornerRadius: cornerRadius))
        .onTapGesture() {
            isFlipped.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + (flipAnimationDuration / 2)) {
                isZIndexFlipped.toggle()
            }
        }
    }
}

struct FlashCardView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardView() {
            Text("Front")
        } backContent: {
            Text("Back")
        }
        .padding(.all)
    }
}
