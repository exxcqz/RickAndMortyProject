//
//  Created by Nikita Gavrikov on 22/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct TabBarState: Equatable {
    @BindableState var selectedTabID: TabID = .characters

    var tabBarItems: IdentifiedArrayOf<TabBarItem> = [
        .init(id: .characters, icon: Asset.TabBarIcons.icCharactersNotActive.image, iconFilled: Asset.TabBarIcons.icCharactersIsActive.image),
        .init(id: .locations, icon: Asset.TabBarIcons.icLocationsNotActive.image, iconFilled: Asset.TabBarIcons.icLocationsIsActive.image),
        .init(id: .episodes, icon: Asset.TabBarIcons.icEpisodesNotActive.image, iconFilled: Asset.TabBarIcons.icEpisodesIsActive.image)
    ]

    var characters = CharactersState()
    var locations = LocationsState()
    var episodes = EpisodesState()
}

enum TabID: Int, Hashable, CaseIterable {
    case characters
    case locations
    case episodes
}
