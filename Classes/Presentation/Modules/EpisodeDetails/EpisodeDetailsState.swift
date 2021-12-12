//
//  Created by Nikita Gavrikov on 12/12/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

struct EpisodeDetailsState: Equatable {
    var episode: Episode = dummyEpisodesArray[0]
    var characters: [Character] = dummyCharactersArray
    var currentPageLoading: Int = 1
    var totalPages: Int = 0
}
