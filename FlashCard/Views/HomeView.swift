//
//  HomeView.swift
//  FlashCard
//
//  Created by Jimmy, Yeung on 13/8/2020.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            CardSetList(viewModel: .init())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
