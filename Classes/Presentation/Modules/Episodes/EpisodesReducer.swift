//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let episodesReducer = Reducer<EpisodesState, EpisodesAction, EpisodesEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
        state.data = dummyEpisodesArray.sorted {
            $0.episodeCode < $1.episodeCode
        }
        print("number of episodes: \(state.data.count)")
        var seasonsSet = Set<Int>()
        state.data.forEach { episode in
            guard let (_, seasonNumber) = episode.convertedEpisodeCode else {
                return
            }
            seasonsSet.insert(seasonNumber)
            print("seasonNumber: \(seasonNumber)")
        }
        state.seasonsNumberArray = seasonsSet.sorted()
        print("number of seasons: \(state.seasonsNumberArray.count)")
        if state.seasonsTitles.count == 1 {
            state.seasonsNumberArray.forEach { index in
                state.seasonsTitles.append("\(L10n.Episodes.SeasonCode.season) \(index)")
            }
        }
        if state.filteredData.isEmpty {
            state.filteredData = state.data
            state.filteredSeasonsNumberArray = state.seasonsNumberArray
        }
    case .seasonSelected(let index):
        state.selectedSeasonIndex = index
        if index == 0 {
            state.filteredData = state.data
            state.filteredSeasonsNumberArray = state.seasonsNumberArray
        } else {
            state.filteredData = []
            state.filteredSeasonsNumberArray = [state.seasonsNumberArray[index - 1]]
            state.data.forEach { episode in
                guard let (_, seasonNumber) = episode.convertedEpisodeCode else {
                    return
                }
                if state.seasonsNumberArray[index - 1] == seasonNumber {
                    state.filteredData.append(episode)
                }
            }
        }
        print("Filter: \(state.seasonsTitles[state.selectedSeasonIndex])")
    case .episodeCardSelected(let episode):
        print("episode \(episode.name) selected")
    case .searchInputChanged(let request):
        state.searchRequest = request
        print("searching episode: \(state.searchRequest)")
    }
    return .none
}
