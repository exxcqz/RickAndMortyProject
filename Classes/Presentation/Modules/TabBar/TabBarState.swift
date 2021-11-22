//
//  Created by Nikita Gavrikov on 22/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

struct TabBarState: Equatable {
    var charactersState = CharactersState()
    var locationsState = LocationsState()
    var episodesState = EpisodesState()
    var selectedTab = Tab.characters

    enum Tab {
        case characters
        case locations
        case episodes
    }
}
