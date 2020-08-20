//
//  CreateCardSetsPage.swift
//  FlashCard
//
//  Created by Jimmy, Yeung on 13/8/2020.
//

import SwiftUI
import Combine

struct CreateCardSetsPage: View {
    @ObservedObject private var viewModel: CreateCardSetsPageViewModel
    private let onCancelClicked: (() -> Void)?
    private let onDoneClicked: ((CardSet) -> Void)?
    
    init(viewModel: CreateCardSetsPageViewModel,
         onCancelClicked: (() -> Void)? = nil,
         onDoneClicked: ((CardSet) -> Void)? = nil) {
        self.viewModel = viewModel
        self.onCancelClicked = onCancelClicked
        self.onDoneClicked = onDoneClicked
    }

    var body: some View {
        NavigationView {
            ScrollView {
                createCardSetsform
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Text("New Set"))
            .navigationBarItems(
                leading: leadingNavigationBarItems,
                trailing: trailingNavigationBarItems
            )
        }
    }
    
    private var leadingNavigationBarItems: some View {
        HStack {
            Button(action: {
                onCancelClicked?()
            }, label: {
                Text("Cancel")
            })
        }
    }
    
    private var trailingNavigationBarItems: some View {
        HStack {
            Button(action: {
                onDoneClicked?(viewModel.makeCardSet())
            }, label: {
                Text("Done")
            })
            .disabled(!viewModel.isValidToSave)
        }
    }
    
    private var createCardSetsform: some View {
        VStack {
            VStack {
                Button(action: {
                    
                }, label: {
                    VStack {
                        Image(systemName: "number.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.purple)
                            .frame(width: 50.0, height: 50.0, alignment: .center)
                        
                        Text("Change Icon")
                            .font(.caption)
                    }
                })
            }

            TextField(
                "Enter your set title",
                text: $viewModel.title,
                onEditingChanged: { _ in },
                onCommit: {}
            )
            .multilineTextAlignment(.center)
            .font(.title)
        }
        .padding()
    }
}

struct CreateCardSetsPage_Previews: PreviewProvider {
    static var previews: some View {
        CreateCardSetsPage(viewModel: .init())
    }
}
