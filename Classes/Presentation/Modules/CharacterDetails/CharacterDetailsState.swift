//
//  Created by Nikita Gavrikov on 12/12/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

struct CharacterDetailsState: Equatable {
    var character: Character = characterData[0]
    var location: Location = locationData[0]
    var episodes: [Episode] = dummyEpisodesArray
}
