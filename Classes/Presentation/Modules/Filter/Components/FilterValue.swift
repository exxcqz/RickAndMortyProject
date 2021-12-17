//
//  Created by Alexander Loshakov on 13.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import SwiftUI

struct FilterValue: View {
    @State var value: String
    @State var currentIndex: Int = 0
    @Binding var selectedIndex: Int?
    @Binding var countOfSelected: Int

    var body: some View {
        Button(
            action: {
                if selectedIndex != currentIndex {
                    if selectedIndex == nil {
                        countOfSelected += 1
                    }
                    selectedIndex = currentIndex
                } else {
                    selectedIndex = nil
                    countOfSelected -= 1
                }
            },
            label: {
                ZStack {
                    Text(value)
                        .font(Font.appFontMedium(ofSize: Layout.scaleFactorW * 16))
                        .kerning(-0.32)
                        .padding(.horizontal, Layout.scaleFactorW * 16)
                        .padding(.vertical, Layout.scaleFactorH * 4)
                        .foregroundColor(
                            selectedIndex == currentIndex
                            ? Color(.white)
                            : Color(Asset.Colors.grayNormal.name)
                        )
                        .background(
                            selectedIndex == currentIndex
                            ? Color(Asset.Colors.primary.name)
                            : Color(Asset.Colors.blackFilterBG.name)
                        )
                        .cornerRadius(Layout.scaleFactorW * 22)
                        .frame(height: Layout.scaleFactorH * 20)
                }
            }
        )
    }
}
