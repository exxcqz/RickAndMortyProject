//
//  Created by Nikita Gavrikov on 12/12/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let episodeDetailsReducer = Reducer<EpisodeDetailsState, EpisodeDetailsAction, EpisodeDetailsEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
        if state.characters.isEmpty {
            state.currentPageLoading = 1
            state.filterParameters.page = state.currentPageLoading
            state.episode.characters.forEach { character in
                var id = character.components(separatedBy: "ter/")
                guard let index = Int(id[1]) else {
                    return
                }
                state.indicies.append(index)
            }
            return environment.apiService.fetchMultipleCharacters(withIds: state.indicies)
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(EpisodeDetailsAction.dataLoaded)
        }
    case .dataLoaded(let result):
        switch result {
        case .success(let characters):
            characters.forEach { character in
                print("id #\(character.id), \(character.name) (with gender \(character.gender))")
            }
            state.characters += characters
            print("number of characters: \(state.characters.count)")
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    return .none
}
