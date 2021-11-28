//
//  Created by Александр Васильевич on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct NavigationView: View {
    @Binding var scaleFactorW: CGFloat
    @Binding var scaleFactorH: CGFloat

    var body: some View {
            ZStack {
                Image(Asset.Pictures.characters.name)
                    .resizable()
                    .frame(height: scaleFactorH * 248.0)
                HStack {
                    Text(L10n.Characters.title)
                        .font(Font.appFontBold(ofSize: 28))
                        .padding(.leading, scaleFactorW * 24)
                        .foregroundColor(.white)
                        .frame(height: scaleFactorH * 34)
                    Spacer()
                }
                .padding(.top, scaleFactorH * 214)
            }
            .frame(width: scaleFactorW * 375, height: scaleFactorH * 248)
    }
}
