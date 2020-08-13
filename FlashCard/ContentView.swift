//
//  ContentView.swift
//  FlashCard
//
//  Created by Jimmy, Yeung on 26/7/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomePageView()
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
