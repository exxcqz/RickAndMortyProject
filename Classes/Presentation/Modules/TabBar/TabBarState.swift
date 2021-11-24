//
//  Created by Nikita Gavrikov on 22/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct TabBarState: Equatable {
    @BindableState var selectedTabID: TabID = .characters

    var tabBarItems: IdentifiedArrayOf<TabBarItemState> = [
        .init(id: .characters, icon: Asset.Icons.icBarCharacters.image, iconFilled: Asset.Icons.icBarCharactersFilled.image),
        .init(id: .locations, icon: Asset.Icons.icBarLocations.image, iconFilled: Asset.Icons.icBarLocationsFilled.image),
        .init(id: .episodes, icon: Asset.Icons.icBarEpisodes.image, iconFilled: Asset.Icons.icBarEpisodesFilled.image)
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

struct TabBarItemState: Equatable, Identifiable {
    var id: TabID
    var isActive: Bool = false
    var icon: UIImage
    var iconFilled: UIImage
}
