//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let episodesReducer = Reducer<EpisodesState, EpisodesAction, EpisodesEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
        if state.data.isEmpty {
            return environment.apiService.fetchAllEpisodes(currentPage: state.currentPageLoading)
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(EpisodesAction.dataLoaded)
        }
    case .fetchAnotherPage:
        state.currentPageLoading += 1
        return environment.apiService.fetchAllEpisodes(currentPage: state.currentPageLoading)
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(EpisodesAction.dataLoaded)
    case .dataLoaded(let result):
        switch result {
        case .success(let episodes):
            if state.data.isEmpty {
                state.seasonsNumberArray.forEach { index in
                    state.seasonsTitles.append("\(L10n.Episodes.SeasonCode.season) \(index)")
                }
            }
            episodes.results.forEach { episode in
                print("id #\(episode.id), \(episode.name) (with code \(episode.episodeCode))")
            }
            episodes.results.forEach { episode in
                guard let (_, seasonNumber) = episode.convertedEpisodeCode else {
                    return
                }
                state.seasonsSet.insert(seasonNumber)
            }
            state.totalPages = episodes.info.pages
            state.totalPagesForFilter = state.totalPages
            state.data += episodes.results
            state.filteredData = state.data
            state.filteredSeasonsNumberArray = state.seasonsSet.sorted()
            print("number of loaded seasons: \(state.filteredSeasonsNumberArray.count)")
            print("number of episodes: \(state.data.count)")
        case .failure(let error):
            print(error.localizedDescription)
        }
    case .filteredDataLoaded(let result):
        switch result {
        case .success(let filteredEpisodes):
            filteredEpisodes.results.enumerated().forEach { (index, episode) in
                print("#\(index + 1): id\(episode.id), \(episode.name)")
            }
            state.filteredData = filteredEpisodes.results
            state.totalPagesForFilter = filteredEpisodes.info.pages
            print("number of filtered episodes: \(state.filteredData.count)")
            state.isFiltering = false
        case .failure(let error):
            print(error.localizedDescription)
        }
    case .seasonSelected(let index):
        state.selectedSeasonIndex = index
        state.isFiltering = true
        print("Filter: \(state.seasonsTitles[state.selectedSeasonIndex])")
        if index == 0 {
            state.totalPagesForFilter = state.totalPages
            state.filteredData = state.data
            state.filteredSeasonsNumberArray = state.seasonsSet.sorted()
            state.isFiltering = false
        } else {
            state.filteredSeasonsNumberArray = [state.seasonsNumberArray[index - 1]]
            return environment.apiService.fetchFilteredEpisodes(seasonNumber: index)
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(EpisodesAction.filteredDataLoaded)
        }
    case .episodeCardSelected(let episode):
        print("episode \(episode.name) selected")
    case .searchInputChanged(let request):
        state.searchRequest = request
        print("searching episode: \(state.searchRequest)")
    }
    return .none
}
