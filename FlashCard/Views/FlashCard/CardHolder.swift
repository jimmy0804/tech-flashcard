//
//  CardHolder.swift
//  FlashCard
//
//  Created by Jimmy Yeung on 22/8/2020.
//

import SwiftUI

struct CardHolder {
    let id = UUID()

    private(set) var rotationDegrees: Angle = .zero
    private(set) var isFront: Bool
    
    var frontContent: String {
        card.question
    }
    
    var backContent: String {
        card.answer
    }
    
    private let card: Card
    
    // MARK: - Init
    
    init(card: Card, isFront: Bool = false) {
        self.card = card
        self.isFront = isFront
        updateRandomRotationDegrees()
    }
    
    // MARK: - Methods
    
    mutating func bringToFront() {
        isFront = true
        updateRandomRotationDegrees()
    }
    
    private mutating func updateRandomRotationDegrees() {
        if !isFront {
            let randomDegree = Bool.random() ? Int.random(in: -3..<0) : Int.random(in: 1...3)
            rotationDegrees = .degrees(Double(randomDegree))
        } else {
            rotationDegrees = .zero
        }
    }
}

extension CardHolder: Identifiable {}
