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
            var selection = viewStore.binding(
                get: { $0.selectedTabID },
                send: TabBarAction.selectedTabIDChange)
            VStack(spacing: 0) {
                Spacer()
                ZStack {
                    switch 0 {
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
                Divider()
                    .frame(height: 2)
                    .background(Color(Asset.Colors.grayDark.name))
                HStack {
                    ForEach(0..<3, id: \.self) { index in
                        Spacer()
                        Button(action: {
//                            selection = index
                        }, label: {
//                            Image(uiImage: selection == index ? iconsFilled[index] : icons[index])
                        })
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
            state: { $0.characters },
            action: TabBarAction.characters)
    }

    private var locationsStore: Store<LocationsState, LocationsAction> {
        return store.scope(
            state: { $0.locations },
            action: TabBarAction.locations)
    }

    private var episodesStore: Store<EpisodesState, EpisodesAction> {
        return store.scope(
            state: { $0.episodes },
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
