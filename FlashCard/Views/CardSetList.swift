//
//  CardSetList.swift
//  FlashCard
//
//  Created by Yeung, Jimmy(AWF) on 26/7/2020.
//

import SwiftUI

final class CardSetListViewModel: ObservableObject {
    @Published var items: [CardSetListItemViewModel]
    
    init() {
        items = [
            CardSetListItemViewModel(
                systemImageName: "number.circle.fill",
                systemImageColor: .purple,
                title: "Bit Maniplication",
                subtitle: "50 cards"),
            CardSetListItemViewModel(
                systemImageName: "number.circle.fill",
                systemImageColor: .purple,
                title: "Bit Maniplication1",
                subtitle: "50 cards"),
            CardSetListItemViewModel(
                systemImageName: "number.circle.fill",
                systemImageColor: .purple,
                title: "Bit Maniplication2",
                subtitle: "50 cards")
        ]
    }
}

struct CardSetList: View {
    @ObservedObject var viewModel: CardSetListViewModel

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.items, id: \.title) { itemViewModel in
                    CardSetListItem(viewModel: itemViewModel)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CardSetList_Previews: PreviewProvider {
    static var previews: some View {
        CardSetList(viewModel: CardSetListViewModel())
    }
}
