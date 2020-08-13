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
    let viewModel: CardSetListItemViewModel

    private let iconSize: CGFloat = 33.0
    
    var body: some View {
        HStack {
            VStack {
                Image(systemName: viewModel.systemImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(viewModel.systemImageColor)
                    .frame(width: iconSize, height: iconSize, alignment: .center)
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .fontWeight(.bold)
                    .font(.title2)
                    .lineLimit(2)

                Text(viewModel.subtitle)
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            VStack {
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
                    .font(.body)
                Spacer()
            }
        }
        .padding(.all)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10.0)
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
            CardSetListItem(viewModel: viewModel)
                .preferredColorScheme(.dark)
            CardSetListItem(viewModel: viewModel)
                .preferredColorScheme(.light)
                .environment(\.sizeCategory, .extraExtraLarge)
        }
        .previewLayout(.fixed(width: 400, height: 150))
    }
}
