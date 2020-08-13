//
//  HomePageView.swift
//  FlashCard
//
//  Created by Jimmy, Yeung on 13/8/2020.
//

import SwiftUI

struct HomePageView: View {
    @State private var isPresentedCreateCardSetsView = false

    var body: some View {
        NavigationView {
            ScrollView {
                CardSetList(viewModel: .init())
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Text("Home"))
            .navigationBarItems(
                leading: leadingNavigationBarItems,
                trailing: trailingNavigationBarItems
            )
            .sheet(isPresented: $isPresentedCreateCardSetsView) {
                CreateCardSetsPageView(
                    viewModel: .init(),
                    onCancelClicked: {
                        isPresentedCreateCardSetsView = false
                    }, onDoneClicked: { cardSet in
                        
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
                isPresentedCreateCardSetsView = true
            }, label: {
                Image(systemName: "plus")
            })
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
