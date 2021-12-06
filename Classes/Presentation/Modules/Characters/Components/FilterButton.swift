//
//  Created by Alexander Loshakov on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct FilterButton: View {
    var body: some View {
        Button(
            action: {},
            label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: Layout.scaleFactorW * 52, height: Layout.scaleFactorW * 52)
                        .foregroundColor(Color(Asset.Colors.blackCard.name))
                    Image(Asset.Icons.icFilter.name)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color(Asset.Colors.grayDark.name))
                        .scaledToFit()
                        .frame(width: Layout.scaleFactorW * 24, height: Layout.scaleFactorW * 24)
                }
            }
        )
    }
}
