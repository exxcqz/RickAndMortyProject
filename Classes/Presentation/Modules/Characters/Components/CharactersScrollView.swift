//
//  Created by Alexander Loshakov on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct CharactersScrollView: View {
    let store: Store<CharactersState, CharactersAction>
    let columns: [GridItem] = Array(repeating: .init(.adaptive(minimum: Layout.scaleFactorW * 156)), count: 1)

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                LazyVGrid(columns: columns, spacing: Layout.scaleFactorW * 16) {
                    ForEach(viewStore.data, id: \.id) { character in
                        CharacterCard(сharacter: character)
                    }
                    if viewStore.filterParameters.page < viewStore.filterParameters.totalPages {
                        ProgressView()
                            .frame(width: Layout.scaleFactorW * 100, height: Layout.scaleFactorW * 100)
                            .padding(.leading, Layout.scaleFactorW * 163)
                            .onAppear {
                                viewStore.send(.fetchNextPage)
                            }
                    }
                }
            }
            .padding(.horizontal, Layout.scaleFactorW * 23)
        }
    }
}
