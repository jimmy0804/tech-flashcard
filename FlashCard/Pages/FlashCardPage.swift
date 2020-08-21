//
//  FlashCardPage.swift
//  FlashCard
//
//  Created by Jimmy Yeung on 20/8/2020.
//

import SwiftUI

struct FlashCardPage: View {
    var body: some View {
        FlashCardStack()
            .frame(width: 300, height: 500, alignment: .center)
    }
}

struct FlashCardStackItemViewModel {
    let rotationDegrees: Angle
}

struct FlashCardStack: View {
    @State var items = [Card]()
//    @State var
        
    

    var body: some View {
        ZStack {
            FlashCardView() {
                Text("Front")
            } backContent: {
                Text("Back")
            }
            .rotationEffect(.degrees(2.0))
            
            FlashCardView() {
                Text("Front")
            } backContent: {
                Text("Back")
            }
            .rotationEffect(.degrees(-2.0))
            
            FlashCardView() {
                Text("Front")
            } backContent: {
                Text("Back")
            }
        }
    }
}

struct FlashCardPage_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardPage()
    }
}
