//
//  Created by Nikita Gavrikov on 12.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct CharacterDetailsInfoView: View {
    var character: Character

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text(L10n.Details.Info.title)
                    .font(Font.appFontSemibold(ofSize: Layout.scaleFactorW * 17))
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
                        Text(L10n.Details.Info.species)
                            .font(Font.appFontMedium(ofSize: Layout.scaleFactorW * 16))
                            .foregroundColor(Color(Asset.Colors.grayNormal.name))
                            .frame(height: 20)
                        Spacer()
                        Text(character.species.rawValue)
                            .font(Font.appFontMedium(ofSize: Layout.scaleFactorW * 16))
                            .foregroundColor(.white)
                            .frame(height: 20)
                    }
                    HStack {
                        Text(L10n.Details.Info.type)
                            .font(Font.appFontMedium(ofSize: Layout.scaleFactorW * 16))
                            .foregroundColor(Color(Asset.Colors.grayNormal.name))
                            .frame(height: 20)
                        Spacer()
                        Text(character.type.rawValue.checkEmpty)
                            .font(Font.appFontMedium(ofSize: Layout.scaleFactorW * 16))
                            .foregroundColor(.white)
                            .frame(height: 20)
                    }
                    HStack {
                        Text(L10n.Details.Info.gender)
                            .font(Font.appFontMedium(ofSize: 16))
                            .foregroundColor(Color(Asset.Colors.grayNormal.name))
                            .frame(height: 20)
                        Spacer()
                        Text(character.gender)
                            .font(Font.appFontMedium(ofSize: 16))
                            .foregroundColor(.white)
                            .frame(height: 20)
                    }
                }
                .padding(.horizontal, Layout.scaleFactorW * 16)
                .padding(.vertical, 16)
            }
        }
        .padding(.horizontal, Layout.scaleFactorW * 24)
    }
}

// MARK: -  Check for empty value

extension String {

    var checkEmpty: String {
        if self.isEmpty {
            return "None"
        }
        return self
    }
}
