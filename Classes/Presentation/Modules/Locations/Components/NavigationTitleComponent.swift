//
//  Created by Nikita Gavrikov on 03.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct NavigationTitleComponent: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(Font.appFontBold(ofSize: Layout.scaleFactorW * 28))
                .padding(.leading, Layout.scaleFactorW * 24)
                .foregroundColor(.white)
                .frame(height: Layout.scaleFactorH * 34)
            Spacer()
        }
        .padding(.top, Layout.scaleFactorH * 214)
    }
}
