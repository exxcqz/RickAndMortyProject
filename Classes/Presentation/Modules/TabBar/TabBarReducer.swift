//
//  Created by Nikita Gavrikov on 22/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let tabBarReducer: Reducer<TabBarState, TabBarAction, TabBarEnvironment> = .combine(
    .init { state, action, _ in
        switch action {
        case .selectedTabIDChange(let selectedTab):
            state.selectedTabID = selectedTab
            return .none
        case .characters(let action):
            break
        case .locations(let action):
			break
        case .episodes(let episode):
            break
        }
        return .none
    },

    charactersReducer.pullback(state: \.characters, action: /TabBarAction.characters) { _ in CharactersEnvironment() },
    locationsReducer.pullback(state: \.locations, action: /TabBarAction.locations) { _ in
        LocationsEnvironment(
            apiService: ServiceContainer().apiServices,
            mainQueue: DispatchQueue.main.eraseToAnyScheduler()
        )
    },
    episodesReducer.pullback(state: \.episodes, action: /TabBarAction.episodes) { _ in EpisodesEnvironment() }
)
