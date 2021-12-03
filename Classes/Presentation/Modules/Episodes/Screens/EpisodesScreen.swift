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
                    EpisodesScrollView(store: store)
                    Spacer()
                }
            }
            .edgesIgnoringSafeArea(.all)
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
