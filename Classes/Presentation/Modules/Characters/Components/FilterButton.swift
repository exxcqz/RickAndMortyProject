//
//  Created by Александр Васильевич on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct FilterButton: View {
    @Binding var scaleFactorW: CGFloat
    @Binding var scaleFactorH: CGFloat

    var body: some View {
        Button(
            action: {},
            label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: scaleFactorW * 52, height: scaleFactorH * 52)
                        .foregroundColor(Color(Asset.Colors.blackCard.name))
                    Image(Asset.Icons.icFilter.name)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color(Asset.Colors.grayDark.name))
                        .scaledToFit()
                        .frame(width: scaleFactorW * 24, height: scaleFactorH * 24)
                }
            }
        )
    }
}
