//
//  Created by Nikita Gavrikov on 22/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

enum TabBarAction: Equatable {
    case characters(CharactersAction)
    case locations(LocationsAction)
    case episodes(EpisodesAction)
    case selectedTabIDChange(TabID)
}
