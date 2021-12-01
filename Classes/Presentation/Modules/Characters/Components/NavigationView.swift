//
//  Created by Александр Васильевич on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        ZStack {
            Image(Asset.Illustrations.characters.name)
                .resizable()
                .frame(height: Layout.scaleFactorH * 248)
            HStack {
                Text(L10n.Characters.title)
                    .font(Font.appFontBold(ofSize: Layout.scaleFactorW * 28))
                    .padding(.leading, Layout.scaleFactorW * 24)
                    .foregroundColor(.white)
                    .frame(height: Layout.scaleFactorH * 34)
                Spacer()
            }
            .padding(.top, Layout.scaleFactorH * 214)
        }
        .frame(width: Layout.scaleFactorW * 375, height: Layout.scaleFactorH * 248)
    }
}
