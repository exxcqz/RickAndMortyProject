//
//  Created by Александр Васильевич on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct SearchAndFilter: View {
    let store: Store<CharactersState, CharactersAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            HStack(spacing: viewStore.scaleFactorW * 16) {
                SearchButton(store: store)
                FilterButton(store: store)
            }
            .frame(height: viewStore.scaleFactorH * 52)
            .padding(.horizontal, viewStore.scaleFactorW * 24)
            .padding(.top, viewStore.scaleFactorH * 16)
            .padding(.bottom, viewStore.scaleFactorH * 24)
        }
    }
}
