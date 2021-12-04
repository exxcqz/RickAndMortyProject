//
//  Created by Alexander Loshakov on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct AppNavigationView: View {
    let imageName: String
    let title: String

    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .frame(height: Layout.scaleFactorH * 248)
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
        .frame(width: Layout.scaleFactorW * 375, height: Layout.scaleFactorH * 248)
    }
}
