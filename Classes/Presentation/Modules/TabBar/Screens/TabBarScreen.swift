//
//  Created by Nikita Gavrikov on 22/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct TabBarScreen: View {
    @State private var selectionTabBar = 0
    let store: Store<TabBarState, TabBarAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack(spacing: 0) {
                Spacer()
                ZStack {
                    switch selectionTabBar {
                    case 0:
                        CharactersScreen(store: charactersStore)
                    case 1:
                        LocationsScreen(store: locationsStore)
                    case 2:
                        EpisodesScreen(store: episodesStore)
                    default:
                        CharactersScreen(store: charactersStore)
                    }
                }
                Spacer()
                TabBarComponent(selection: $selectionTabBar)
            }
        }
    }
}

// MARK: -  Getting store of modules

extension TabBarScreen {

    private var charactersStore: Store<CharactersState, CharactersAction> {
        return store.scope(
            state: { $0.charactersState },
            action: TabBarAction.characters)
    }

    private var locationsStore: Store<LocationsState, LocationsAction> {
        return store.scope(
            state: { $0.locationsState },
            action: TabBarAction.locations)
    }

    private var episodesStore: Store<EpisodesState, EpisodesAction> {
        return store.scope(
            state: { $0.episodesState },
            action: TabBarAction.episodes)
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
