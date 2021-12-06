//
//  Created by Nikita Gavrikov on 06.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct DetailsInfoComponent: View {
    let species: String
    let type: String
    let gender: String

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Info")
                    .font(Font.appFontSemibold(ofSize: 17))
                    .foregroundColor(.white)
                    .frame(height: 22)
                Spacer()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color(Asset.Colors.blackCard.name))
                    .frame(width: Layout.scaleFactorW * 327, height: 124)
                VStack(spacing: 16) {
                    HStack {
                        Text("Species:")
                            .font(Font.appFontMedium(ofSize: 16))
                            .foregroundColor(Color(Asset.Colors.grayNormal.name))
                            .frame(height: 20)
                        Spacer()
                        Text(species)
                            .font(Font.appFontMedium(ofSize: 16))
                            .foregroundColor(.white)
                            .frame(height: 20)
                    }
                    HStack {
                        Text("Type:")
                            .font(Font.appFontMedium(ofSize: 16))
                            .foregroundColor(Color(Asset.Colors.grayNormal.name))
                            .frame(height: 20)
                        Spacer()
                        Text(type.checkEmpty)
                            .font(Font.appFontMedium(ofSize: 16))
                            .foregroundColor(.white)
                            .frame(height: 20)
                    }
                    HStack {
                        Text("Gender:")
                            .font(Font.appFontMedium(ofSize: 16))
                            .foregroundColor(Color(Asset.Colors.grayNormal.name))
                            .frame(height: 20)
                        Spacer()
                        Text(gender)
                            .font(Font.appFontMedium(ofSize: 16))
                            .foregroundColor(.white)
                            .frame(height: 20)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
            }
        }
        .padding(.horizontal, 24)
    }
}
