//
//  Created by Nikita Gavrikov on 02.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct LocationsTitleComponent: View {
    var body: some View {
        HStack {
            Text(L10n.Locations.title)
                .font(Font.appFontBold(ofSize: Layout.scaleFactorW * 28))
                .padding(.leading, Layout.scaleFactorW * 24)
                .foregroundColor(.white)
                .frame(height: 34)
            Spacer()
        }
        .padding(.top, Layout.scaleFactorH * 214)
    }
}
