//
//  Created by Nikita Gavrikov on 22/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct TabBarScreen: View {
    let store: Store<TabBarState, TabBarAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            let selection = viewStore.binding(
                get: {
                    $0.selectedTabID
                },
                send: TabBarAction.selectedTabIDChange
            )
            VStack(spacing: 0) {
                Spacer()
                ZStack {
                    switch selection.wrappedValue {
                    case .characters:
                        CharactersScreen(store: charactersStore)
                    case .locations:
                        LocationsScreen(store: locationsStore)
                    case .episodes:
                        EpisodesScreen(store: episodesStore)
                    }
                }
                Spacer()
                Divider()
                    .frame(height: 2)
                    .background(Color(Asset.Colors.grayDark.name))
                HStack {
                    ForEach(TabID.allCases, id: \.self) { tabID in
                        Spacer()
                        Button(
                            action: {
                                viewStore.send(TabBarAction.selectedTabIDChange(tabID))
                            },
                            label: {
                                Image(
                                    uiImage: selection.wrappedValue == tabID
                                    ? viewStore.tabBarItems[tabID.rawValue].iconFilled
                                    : viewStore.tabBarItems[tabID.rawValue].icon
                                )
                            }
                        )
                        Spacer()
                    }
                }
                .padding(.top)
                .padding(.bottom)
                .background(Color(Asset.Colors.blackCard.name).edgesIgnoringSafeArea(.bottom))
            }
        }
    }
}

// MARK: -  Getting store of modules

extension TabBarScreen {

    private var charactersStore: Store<CharactersState, CharactersAction> {
        return store.scope(
            state: {
                $0.characters
            },
            action: TabBarAction.characters
        )
    }

    private var locationsStore: Store<LocationsState, LocationsAction> {
        return store.scope(
            state: {
                $0.locations
            },
            action: TabBarAction.locations
        )
    }

    private var episodesStore: Store<EpisodesState, EpisodesAction> {
        return store.scope(
            state: {
                $0.episodes
            },
            action: TabBarAction.episodes
        )
    }
}

struct TabBarScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabBarScreen(
            store: Store(
                initialState: TabBarState(),
                reducer: tabBarReducer,
                environment: TabBarEnvironment()
            )
        )
    }
}
