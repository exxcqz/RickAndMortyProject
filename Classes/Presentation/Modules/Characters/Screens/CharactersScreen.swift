//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct CharactersScreen: View {
    let store: Store<CharactersState, CharactersAction>

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
                                isFilterHidden: true,
                                searchRequest: viewStore.binding(
                                    get: {
                                        $0.searchRequest
                                    }, send: {
                                        CharactersAction.searchInputChanged($0)
                                    }
                                )
                            )
                            if viewStore.state.data.isEmpty {
                                ProgressView()
                                    .padding(.top, Layout.scaleFactorH * 150)
                            } else {
                                CharactersScrollView(store: store)
                                    .padding(.vertical, Layout.scaleFactorH * 16)
                                    .zIndex(0)
                            }
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

struct CharactersScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharactersScreen(
            store: Store(
                initialState: CharactersState(),
                reducer: charactersReducer,
                environment: CharactersEnvironment(
                    apiService: ServiceContainer().apiServices,
                    mainQueue: DispatchQueue.main.eraseToAnyScheduler()
                )
            )
        )
    }
}
