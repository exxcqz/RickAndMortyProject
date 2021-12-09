//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct DetailsState: Equatable {
    var selectedDetails: Details = .character
    var character: Character = dummyCharactersArray[0]
    var location: Location = listLocations[0]
    var episode: Episode = dummyEpisodesArray[0]
    var characters: [Character] = dummyCharactersArray
    var locations: [Location] = listLocations
    var episodes: [Episode] = dummyEpisodesArray
}

enum Details: Int, Hashable, CaseIterable {
    case character
    case location
    case episode
}
