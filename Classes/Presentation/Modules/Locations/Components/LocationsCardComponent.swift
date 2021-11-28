//
//  Created by Nikita Gavrikov on 28.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct LocationsCardComponent: View {
    let card: LocationsCardItem

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color(Asset.Colors.blackCard.name))
                .frame(width: 327.0, height: 80.0, alignment: .center)
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(Asset.Colors.blackElements.name))
                        .frame(width: 64.0, height: 64.0)
                    Image(uiImage: card.icon)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24.0, height: 24.0)
                }
                .padding(.leading, 32.0)
                .padding(.trailing, 16.0 )
                VStack(alignment: .leading, spacing: 0) {
                    Text(card.nameLocation)
                        .font(Font.appFontSemibold(ofSize: 17))
                        .frame(height: 22.0)
                        .foregroundColor(.white)
                        .padding(.bottom, 4.0)
                    Text(card.typeLocation)
                        .font(Font.appFontMedium(ofSize: 13))
                        .frame(height: 18.0)
                        .foregroundColor(Color(Asset.Colors.primary.name))
                        .padding(.top, 4.0)
                }
                Spacer()
            }
        }
        .padding(.top, 8.0)
        .padding(.bottom, 8.0)
    }
}
