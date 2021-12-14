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
                let isFilterPresented = viewStore.binding(
                    get: {
                        $0.isFilterPresented
                    },
                    send: { _ in
                        if viewStore.filter.appliedParams.isEmpty {
                            return CharactersAction.filterSelected(.onDisappear)
                        } else {
                            return CharactersAction.filterSelected(.applyFilter)
                        }
                    }
                )
                let isFilterButtonActive = viewStore.binding(
                    get: {
                        $0.isFilterButtonActive
                    },
                    send: { _ in
                        CharactersAction.filterButtonTapped
                    }
                )
                let searchRequest = viewStore.binding(
                    get: {
                        $0.searchRequest
                    }, send: {
                        CharactersAction.searchInputChanged($0)
                    }
                )
                ZStack {
                    Color(Asset.Colors.blackBG.color)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            StickyHeaderComponent(
                                navigationImage: viewStore.state.navigationImage,
                                navigationTitle: viewStore.state.navigationTitle,
                                isFilterHidden: true,
                                searchRequest: searchRequest,
                                isFilterButtonActive: isFilterButtonActive
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
                .sheet(
                    isPresented: isFilterPresented,
                    onDismiss: {
                        if viewStore.filter.appliedParams.isEmpty {
                            print("фильтр пустой!") // обновить filterdata (удалить все и сделать onAppear)
                        } else {
                            print("фильтруем: \(viewStore.filter.appliedParams)") // экшн в редьюсер
                        }
                    },
                    content: {
                        FilterScreen(store: self.filterStore)
                    }
                )
            }
            .navigationBarHidden(true)
        }
    }
}

// MARK: -  Getting store of filter

extension CharactersScreen {
    private var filterStore: Store<FilterState, FilterAction> {
        return store.scope(
            state: {
                $0.filter
            },
            action: CharactersAction.filterSelected
        )
    }
}

struct CharactersScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharactersScreen(
            store: Store(
                initialState: CharactersState(),
                reducer: charactersReducer,
                environment: CharactersEnvironment(
                    apiService: ServiceContainer().charactersService,
                    mainQueue: DispatchQueue.main.eraseToAnyScheduler()
                )
            )
        )
    }
}
