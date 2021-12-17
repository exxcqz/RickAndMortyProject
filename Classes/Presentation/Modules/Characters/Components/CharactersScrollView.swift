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
                        CharacterDetailsScreen(
                            store: Store(
                                initialState: CharacterDetailsState(character: character),
                                reducer: characterDetailsReducer,
                                environment: CharacterDetailsEnvironment(
                                    apiService: ServiceContainer().episodesService,
                                    apiServiceLocation: ServiceContainer().locationsService,
                                    mainQueue: DispatchQueue.main.eraseToAnyScheduler()
                                )
                            )
                        )
                    } label: {
                        CharacterCard(сharacter: character)
                    }
                }
                if viewStore.filterParameters.page < viewStore.filterParameters.totalPages {
                    ProgressView()
                        .onAppear {
                            viewStore.send(.fetchNextPage)
                        }
                }
            }
            .padding(.horizontal, Layout.scaleFactorW * 24)
        }
    }
}
