//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

enum EpisodesAction: Equatable {
    case onAppear
    case seasonSelected(Int)
    case episodeCardSelected(EpisodeModel)
}
