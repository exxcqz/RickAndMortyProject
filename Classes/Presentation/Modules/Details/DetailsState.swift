//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

struct DetailsState: Equatable {
    var selectedDetails: Details = .character
    var character: CharacterModel = dummyCharactersArray[0]
    var location: Location = listLocations[0]
    var episodes: [Episode] = dummyEpisodesArray
}

enum Details: Int, Hashable, CaseIterable {
    case character
    case location
    case episode
}
