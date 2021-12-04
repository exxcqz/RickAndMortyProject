//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let episodesReducer = Reducer<EpisodesState, EpisodesAction, EpisodesEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
        state.data = dummyEpisodesArray
        print("number of episodes: \(state.data.count)")
        var seasonsSet = Set<Int>()
        state.data.forEach { episode in
            guard let (_, seasonNumber) = convertingEpisodeCode(episodeCode: episode.episodeCode) else {
                return
            }
            seasonsSet.insert(seasonNumber)
            print("seasonNumber: \(seasonNumber)")
        }
        state.seasonsNumberArray = seasonsSet.sorted()
        print("number of seasons: \(state.seasonsNumberArray.count)")
        if state.seasonsTitles.count == 1 {
            state.seasonsNumberArray.forEach { index in
                state.seasonsTitles.append("Season \(index)")
            }
        }
        if state.filtredData.isEmpty {
            state.filtredData = state.data
            state.filtredSeasonsNumberArray = state.seasonsNumberArray
        }
    case .seasonSelected(let index):
        state.selectedSeasonIndex = index
        if index == 0 {
            state.filtredData = state.data
            state.filtredSeasonsNumberArray = state.seasonsNumberArray
        } else {
            state.filtredData = []
            state.filtredSeasonsNumberArray = []
            var seasonsSet = Set<Int>()
            state.data.forEach { episode in
                if let (_, seasonNumber) = convertingEpisodeCode(episodeCode: episode.episodeCode) {
                    if state.seasonsNumberArray[index - 1] == seasonNumber {
                        state.filtredData.append(episode)
                        seasonsSet.insert(seasonNumber)
                    }
                }
            }
            state.filtredSeasonsNumberArray = seasonsSet.sorted()
        }
        print("Filter: \(state.seasonsTitles[state.selectedSeasonIndex]) with index: \(state.selectedSeasonIndex)")
    case .episodeCardSelected(let episode):
        print("episode \(episode.name) selected")
    case .searchFor(let request):
        state.searchingRequest = request
        print("searching episode: \(state.searchingRequest)")
    }
    return .none
}
