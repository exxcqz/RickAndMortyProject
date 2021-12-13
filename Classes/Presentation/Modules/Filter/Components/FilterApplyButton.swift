//
//  Created by Александр Васильевич on 13.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import SwiftUI

struct FilterApplyButton: View {
    @State var isActive: Bool = false

    var body: some View {
        ZStack {
            Rectangle()
                .frame(
                    width: Layout.scaleFactorW * 375,
                    height: Layout.scaleFactorH * 96
                )
                .foregroundColor(Color(Asset.Colors.blackCard.name))
            Button(
                action: {
                    isActive.toggle()
                },
                label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: Layout.scaleFactorW * 12)
                            .frame(
                                width: Layout.scaleFactorW * 327,
                                height: Layout.scaleFactorH * 54
                            )
                            .foregroundColor(
                                isActive
                                ? Color(Asset.Colors.primary.name)
                                : Color(.white).opacity(0.1)
                            )
                        Text(L10n.Filters.Action.apply)
                            .font(Font.appFontSemibold(ofSize: Layout.scaleFactorW * 17))
                            .foregroundColor(.white)
                    }
                }
            )
        }
    }
}

struct FilterApplyButton_Previews: PreviewProvider {
    static var previews: some View {
        FilterApplyButton()
    }
}
