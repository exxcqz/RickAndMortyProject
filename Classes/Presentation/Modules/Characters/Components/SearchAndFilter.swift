//
//  Created by Alexander Loshakov on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct SearchAndFilter: View {
    @State var searchText = ""
    @State var searching = false

    var body: some View {
        HStack(spacing: Layout.scaleFactorW * 16) {
            SearchBar(searchText: $searchText)
            FilterButton()
        }
        .frame(height: Layout.scaleFactorW * 52)
        .padding(.horizontal, Layout.scaleFactorW * 24)
        .padding(.top, Layout.scaleFactorH * 16)
        .padding(.bottom, Layout.scaleFactorH * 8)
    }
}
