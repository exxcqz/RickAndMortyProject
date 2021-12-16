//
//  Created by Alexander Loshakov on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct CharactersScrollView: View {
    let store: Store<CharactersState, CharactersAction>
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        WithViewStore(store) { viewStore in
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewStore.data, id: \.id) { character in
                    NavigationLink {
                        CharacterDetailsScreen(store: characterDetailsStore)
                            .onAppear {
                                viewStore.send(.characterCardSelected(character))
                            }
                    } label: {
                        CharacterCard(сharacter: character)
                    }
                }
                if viewStore.currentPageLoading < viewStore.totalPagesForFilter && !viewStore.isFiltering {
                    ProgressView()
                        .onAppear {
                            viewStore.send(.fetchAnotherPage)
                        }
                }
            }
            .padding(.horizontal, Layout.scaleFactorW * 24)
        }
    }
}

// MARK: -  Getting store of CharacterDetails

extension CharactersScrollView {

    private var characterDetailsStore: Store<CharacterDetailsState, CharacterDetailsAction> {
        return store.scope(
            state: {
                $0.details
            },
            action: CharactersAction.details
        )
    }
}
