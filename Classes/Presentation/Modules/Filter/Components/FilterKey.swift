//
//  Created by Alexander Loshakov on 13.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import SwiftUI

struct FilterKey: View {
    @State var name: String

    var body: some View {
        HStack(spacing: 0) {
            Text(name)
                .font(Font.appFontMedium(ofSize: Layout.scaleFactorW * 16))
                .foregroundColor(.white)
                .kerning(-0.32)
                .frame(height: Layout.scaleFactorW * 20)
            Spacer()
        }
        .padding(.leading, Layout.scaleFactorW * 8)
        .padding(.vertical, Layout.scaleFactorH * 8)
    }
}

struct FilterKey_Previews: PreviewProvider {
    static var previews: some View {
        FilterKey(name: "Status")
    }
}
