//
//  Created by Александр Васильевич on 13.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import SwiftUI

struct FilterValue: View {
    @State var value: String
    @State var isActive: Bool = false

    var body: some View {
        Button(
            action: {
                self.isActive.toggle()
            },
            label: {
                ZStack {
                    Text(value)
                        .font(Font.appFontMedium(ofSize: Layout.scaleFactorW * 16))
                        .kerning(-0.32)
                        .padding(.horizontal, Layout.scaleFactorW * 16)
                        .padding(.vertical, Layout.scaleFactorH * 4)
                        .foregroundColor(
                            isActive
                            ? Color(.white)
                            : Color(Asset.Colors.grayNormal.name)
                        )
                        .background(
                            isActive
                            ? Color(Asset.Colors.primary.name)
                            : Color(hex: 0x1C2031) // поменять цвет
                        )
                        .cornerRadius(Layout.scaleFactorW * 22)
                        .frame(height: Layout.scaleFactorH * 20)
                }
            }
        )
    }
}

struct FilterValue_Previews: PreviewProvider {
    static var previews: some View {
        FilterValue(value: "Alive")
    }
}
