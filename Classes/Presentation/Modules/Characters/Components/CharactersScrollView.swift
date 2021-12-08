//
//  Created by Alexander Loshakov on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct CharactersScrollView: View {
    let store: Store<CharactersState, CharactersAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                if !viewStore.grid.isEmpty {
                    VStack(spacing : Layout.scaleFactorW * 16) {
                        ForEach(viewStore.grid, id: \.self) { row in
                            HStack(spacing: Layout.scaleFactorW * 16) {
                                ForEach(row...row + 1, id: \.self) { column in
                                    VStack {
                                        if column != viewStore.data.count {
                                            CharacterCard(сharacter: viewStore.data[column])
                                        }
                                    }
                                }
                                if row == viewStore.grid.last! && viewStore.data.count % 2 != 0 {
                                    Spacer(minLength: 0)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, Layout.scaleFactorW * 23)
                }
            }
        }
    }
}
