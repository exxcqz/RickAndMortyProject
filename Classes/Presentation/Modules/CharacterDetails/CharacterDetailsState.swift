//
//  Created by Nikita Gavrikov on 12/12/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

struct CharacterDetailsState: Equatable {
    var character: Character = dummyCharactersArray[0]
    var location: [Location] = []
    var episodes: [Episode] = []
    var indicies: [Int] = []
    var idLocation: [Int] = []
}
