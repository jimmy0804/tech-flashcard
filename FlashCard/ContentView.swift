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
            HomeView()
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(Text("Home"))
                .navigationBarItems(leading: leadingNavigationBarItems,
                                    trailing: trailingNavigationBarItems)
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
                
            }, label: {
                Image(systemName: "plus")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
