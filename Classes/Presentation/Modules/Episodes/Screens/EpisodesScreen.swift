//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct EpisodesScreen: View {
    let store: Store<EpisodesState, EpisodesAction>
    @State var selectedIndex: Int = 0
    @State var searchText: String = ""

    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                Color(Asset.Colors.blackBG.color)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 0) {
                    NavigationView(
                        imageName: Asset.Illustrations.episodes.name,
                        title: L10n.Episodes.title
                    )
                    SearchBar(searchText: $searchText)
                        .frame(height: Layout.scaleFactorH * 52)
                        .padding(.horizontal, Layout.scaleFactorW * 24)
                        .padding(.top, Layout.scaleFactorH * 16)
                        .padding(.bottom, Layout.scaleFactorH * 24)
                    AppSegmentedControl(store: store)
                        .padding(.bottom, Layout.scaleFactorH * 24)
                    VStack {
                        if !viewStore.filtredData.isEmpty {
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing : Layout.scaleFactorW * 16) {
                                    ForEach(viewStore.state.filtredSeasonsNumberArray, id: \.self) { seasonTitle in
                                        HStack {
                                            Text("Season \(seasonTitle)")
                                                .foregroundColor(.white)
                                                .font(Font.appFontBold(ofSize: Layout.scaleFactorW * 20))
                                                .kerning(0.38)
                                            Spacer()
                                        }
                                        ForEach(viewStore.state.filtredData, id: \.id) { episode in
                                            if let (_, seasonNumber) = convertingEpisodeCode(episodeCode: episode.episodeCode) {
                                                if seasonTitle == seasonNumber {
                                                    HStack(spacing: Layout.scaleFactorW * 16) {
                                                        EpisodeCard(data: episode)
                                                            .onTapGesture {
                                                                viewStore.send(.episodeCardSelected(episode))
                                                            }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal, Layout.scaleFactorW * 23)
                            }
                        }
                    }
                    Spacer()
                }
            }
            .edgesIgnoringSafeArea([.top, .horizontal])
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

struct EpisodesScreen_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesScreen(
            store: Store(
                initialState: EpisodesState(),
                reducer: episodesReducer,
                environment: EpisodesEnvironment()
            )
        )
    }
}
