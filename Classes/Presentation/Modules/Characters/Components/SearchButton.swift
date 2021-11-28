//
//  Created by Александр Васильевич on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct SearchButton: View {
    @Binding var scaleFactorW: CGFloat
    @Binding var scaleFactorH: CGFloat

    var body: some View {
        Button(
            action: {},
            label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: scaleFactorH * 52)
                        .foregroundColor(Color(Asset.Colors.blackCard.name))
                    HStack {
                        Image(Asset.Icons.icSearchSmall.name)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color(Asset.Colors.grayDark.name))
                            .frame(width: scaleFactorW * 20, height: scaleFactorH * 20)
                        Text(L10n.Placeholder.search)
                            .font(Font.appFontMedium(ofSize: 16))
                            .kerning(-0.32)
                            .foregroundColor(Color(Asset.Colors.grayDark.name))
                            .frame(height: scaleFactorH * 20)
                    }
                }
            }
        )
    }
}
