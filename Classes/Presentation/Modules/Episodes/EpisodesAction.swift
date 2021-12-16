//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

enum EpisodesAction: Equatable {
    case onAppear
    case fetchAnotherPage
    case seasonSelected(Int)
    case episodeCardSelected(Episode)
    case dataLoaded(Result<GeneralRequest<Episode>, NetworkError>)
    case filteredDataLoaded(Result<GeneralRequest<Episode>, NetworkError>)
    case searchInputChanged(String)
    case details(EpisodeDetailsAction)
}
