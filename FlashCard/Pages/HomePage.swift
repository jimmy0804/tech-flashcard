//
//  HomePage.swift
//  FlashCard
//
//  Created by Jimmy, Yeung on 13/8/2020.
//

import SwiftUI

struct HomePage: View {
    @ObservedObject private var viewModel: HomePageViewModel
    @State private var isPresentedCreateCardSetsPageView = false
    
    init(viewModel: HomePageViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            ScrollView {
                CardSetList(viewModel: .init(cardSets: viewModel.cardSets))
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Text("Home"))
            .navigationBarItems(
                leading: leadingNavigationBarItems,
                trailing: trailingNavigationBarItems
            )
            .sheet(
                isPresented: $isPresentedCreateCardSetsPageView,
                onDismiss: {
                    viewModel.processPendingUpdates()
                }
            ) {
                CreateCardSetsPage(
                    viewModel: .init(mode: .createNew),
                    onCancelClicked: {
                        isPresentedCreateCardSetsPageView = false
                    }, onDoneClicked: { cardSet in
                        viewModel.addPendingUpdate(cardSet: cardSet)
                        isPresentedCreateCardSetsPageView = false
                    }
                )
            }
        }
    }
    
    private var leadingNavigationBarItems: some View {
        HStack {
            Button(action: {
                
            }, label: {
                Image(systemName: "gear")
            })
        }
    }
    
    private var trailingNavigationBarItems: some View {
        HStack {
            Button(action: {
                isPresentedCreateCardSetsPageView = true
            }, label: {
                Image(systemName: "plus")
            })
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(viewModel: .init(cardSets: []))
    }
}
