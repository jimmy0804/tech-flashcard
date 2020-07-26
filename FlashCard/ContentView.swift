//
//  ContentView.swift
//  FlashCard
//
//  Created by Jimmy, Yeung on 26/7/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CardSetList(viewModel: .init())
                .navigationTitle(Text("Card Set"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
