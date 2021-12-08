//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct DetailsState: Equatable {
    var selectedDetails: Details = .character
    var characters: [Character] = dummyCharactersArray
    var location: Location = listLocations[0]
    var episodes: [Episode] = dummyEpisodesArray
    var episode: Episode = dummyEpisodesArray[1]
}

enum Details: Int, Hashable, CaseIterable {
    case character
    case location
    case episode
}
