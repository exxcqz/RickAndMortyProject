//
//  Created by Александр Васильевич on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct SearchAndFilter: View {
    @Binding var scaleFactorW: CGFloat
    @Binding var scaleFactorH: CGFloat

    var body: some View {
        HStack(spacing: scaleFactorW * 16) {
            SearchButton(scaleFactorW: $scaleFactorW, scaleFactorH: $scaleFactorH)
            FilterButton(scaleFactorW: $scaleFactorW, scaleFactorH: $scaleFactorH)
        }
        .frame(height: scaleFactorH * 52)
        .padding(.horizontal, scaleFactorW * 24)
        .padding(.top, scaleFactorH * 16)
        .padding(.bottom, scaleFactorH * 24)
    }
}
