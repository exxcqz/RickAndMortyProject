//
//  Created by Nikita Gavrikov on 12/12/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

struct CharacterDetailsState: Equatable {
    var character: Character = dummyCharactersArray[0]
    var location: Location = listLocations[0]
    var episodes: [Episode] = []
    var indicies: [Int] = []
}
