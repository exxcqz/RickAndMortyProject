//
//  Created by Alexander Loshakov on 13.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import SwiftUI

struct FilterBar: View {
    @Binding var resetAll: Bool
    @Binding var countOfSelected: Int

    var body: some View {
        ZStack {
            Rectangle()
                .frame(
                    width: Layout.scaleFactorW * 375,
                    height: Layout.scaleFactorH * 68
                )
                .foregroundColor(Color(Asset.Colors.blackCard.name))
            RoundedRectangle(cornerRadius: Layout.scaleFactorW * 100)
                .frame(
                    width: Layout.scaleFactorW * 55,
                    height: Layout.scaleFactorH * 5
                )
                .foregroundColor(Color(Asset.Colors.grayDark.name))
                .padding(.top, Layout.scaleFactorH * 16)
                .padding(.bottom, Layout.scaleFactorH * 47)
            HStack {
                Text(L10n.Filters.title)
                    .font(Font.appFontBold(ofSize: Layout.scaleFactorW * 20))
                    .foregroundColor(.white)
                    .kerning(0.38)
                Spacer()
                Button(
                    action: {
                        resetAll.toggle()
                        countOfSelected = 0
                        // очистить модельку параметров
                    }, label: {
                        Text(L10n.Filters.Action.resetAll)
                            .font(Font.appFontSemibold(ofSize: Layout.scaleFactorW * 17))
                            .foregroundColor(Color(.white).opacity(0.6))
                            .kerning(-0.41)
                    }
                )
            }
            .padding(.top, Layout.scaleFactorH * 36)
            .padding(.bottom, Layout.scaleFactorH * 8)
            .padding(.horizontal, Layout.scaleFactorW * 24)
        }
    }
}
