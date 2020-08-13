//
//  CardSetList.swift
//  FlashCard
//
//  Created by Jimmy, Yeung on 26/7/2020.
//

import SwiftUI

final class CardSetListViewModel: ObservableObject {
    @Published var items = [CardSetListItemViewModel]()
    
    init(cardSets: [CardSet]) {
        items = cardSets.map { CardSetListItemViewModel(cardSet: $0) }
    }
}

struct CardSetList: View {
    @ObservedObject var viewModel: CardSetListViewModel

    var body: some View {
        VStack(spacing: 0) {
            makeListHeader(title: "Sets")
            
            LazyVStack() {
                ForEach(viewModel.items) { itemViewModel in
                    CardSetListItem(viewModel: itemViewModel)
                        .contextMenu {
                            Text("Menu Item 1")
                            Text("Menu Item 2")
                            Text("Menu Item 3")
                        }
                        .animation(nil)
                }
            }
            .animation(Animation.easeInOut.delay(0.5))
        }
        .padding(.horizontal)
    }
    
    private func makeListHeader(title: String) -> some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
        }
        .padding(.vertical)
    }
}

struct CardSetList_Previews: PreviewProvider {
    static var previews: some View {
        CardSetList(viewModel: CardSetListViewModel(cardSets: []))
    }
}
