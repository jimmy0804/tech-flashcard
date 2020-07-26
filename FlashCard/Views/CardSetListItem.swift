//
//  CardSetListItem.swift
//  FlashCard
//
//  Created by Jimmy, Yeung on 26/7/2020.
//

import SwiftUI

struct CardSetListItemViewModel  {
    let id = UUID()
    let systemImageName: String
    let systemImageColor: Color
    let title: String
    let subtitle: String
}

struct CardSetListItem: View {
    @Environment(\.sizeCategory) var sizeCategory
    let viewModel: CardSetListItemViewModel
    private let iconSize: CGFloat = 33.0
    
    var body: some View {
        ZStack {
            Rectangle()
//                .foregroundColor(.)
            HStack(spacing: 16.0) {
                ZStack {
                    Image(systemName: viewModel.systemImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(viewModel.systemImageColor)
                        .frame(width: iconSize, height: iconSize, alignment: .center)
                }
                
                VStack(alignment: .leading) {
                    Text(viewModel.title)
                        .font(.title)
                        .fontWeight(.bold)

                    Text(viewModel.subtitle)
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
                    .font(.body)
            }
            .padding(.all)
        }
        .cornerRadius(5.0)
    }
}

struct CardSetListItem_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CardSetListItemViewModel(
            systemImageName: "number.circle.fill",
            systemImageColor: .purple,
            title: "Bit Maniplication",
            subtitle: "50 cards")

        Group {
            CardSetListItem(viewModel: viewModel)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            CardSetListItem(viewModel: viewModel)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            CardSetListItem(viewModel: viewModel)
                .preferredColorScheme(.light)
                .environment(\.sizeCategory, .extraExtraLarge)
                .previewLayout(.sizeThatFits)
        }
    }
}
