//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct EpisodesScreen: View {
    let store: Store<EpisodesState, EpisodesAction>

    var body: some View {
        NavigationView {
            WithViewStore(store) { viewStore in
                ZStack {
                    Color(Asset.Colors.blackBG.color)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            StickyHeaderComponent(
                                navigationImage: viewStore.state.navigationImage,
                                navigationTitle: viewStore.state.navigationTitle,
                                isFilterHidden: false,
                                searchRequest: viewStore.binding(
                                    get: {
                                        $0.searchRequest
                                    }, send: {
                                        EpisodesAction.searchInputChanged($0)
                                    }
                                )
                            )
                            AppSegmentedControl(store: store)
                                .padding(.top, Layout.scaleFactorH * 16)
                                .padding(.bottom, Layout.scaleFactorH * 8)
                            EpisodesScrollView(store: store)
                                .padding(.vertical, Layout.scaleFactorH * 16)
                                .zIndex(0)
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    viewStore.send(.onAppear)
                }
            }
            .navigationBarHidden(true)
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
