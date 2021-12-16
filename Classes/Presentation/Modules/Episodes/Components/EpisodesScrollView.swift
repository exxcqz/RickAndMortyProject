//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct EpisodesScrollView: View {
    let store: Store<EpisodesState, EpisodesAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            if !viewStore.filteredData.isEmpty {
                LazyVStack(spacing : Layout.scaleFactorW * 16) {
                    ForEach(viewStore.state.filteredSeasonsNumberArray, id: \.self) { seasonTitle in
                        HStack {
                            Text("Season \(seasonTitle)")
                                .foregroundColor(.white)
                                .font(Font.appFontBold(ofSize: Layout.scaleFactorW * 20))
                                .kerning(0.38)
                            Spacer()
                        }
                        ForEach(viewStore.state.filteredData, id: \.id) { episode in
                            if let (_, seasonNumber) = episode.convertedEpisodeCode {
                                if seasonTitle == seasonNumber {
                                    HStack(spacing: Layout.scaleFactorW * 16) {
                                        NavigationLink {
                                            EpisodeDetailsScreen(store: episodeDetailsStore)
                                                .onAppear {
                                                    viewStore.send(.episodeCardSelected(episode))
                                                }
                                        } label: {
                                            EpisodeCard(episode: episode)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if viewStore.currentPageLoading < viewStore.totalPagesForFilter && !viewStore.isFiltering {
                        ProgressView()
                            .onAppear {
                                viewStore.send(.fetchAnotherPage)
                            }
                    }
                }
                .padding(.horizontal, Layout.scaleFactorW * 23)
            }
        }
    }
}

// MARK: -  Getting store of EpisodeDetails

extension EpisodesScrollView {

    private var episodeDetailsStore: Store<EpisodeDetailsState, EpisodeDetailsAction> {
        return store.scope(
            state: {
                $0.details
            },
            action: EpisodesAction.details
        )
    }
}

struct EpisodesScrollView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesScrollView(
            store: Store(
                initialState: EpisodesState(),
                reducer: episodesReducer,
                environment: EpisodesEnvironment(
                    apiService: ServiceContainer().episodesService,
                    mainQueue: DispatchQueue.main.eraseToAnyScheduler()
                )
            )
        )
    }
}
