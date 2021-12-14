//
//  Created by Nikita Gavrikov on 12/12/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let episodeDetailsReducer = Reducer<EpisodeDetailsState, EpisodeDetailsAction, EpisodeDetailsEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
        if state.characters.isEmpty {
            state.episode.characters.forEach { character in
                let urlCharacter = URL(string: character)
                let lastPath = urlCharacter?.lastPathComponent
                guard let idString = lastPath, let id = Int(idString) else {
                    return
                }
                state.indicies.append(id)
            }
            return environment.apiService.fetchMultipleCharacters(withIds: state.indicies)
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(EpisodeDetailsAction.dataLoaded)
        }
    case .dataLoaded(let result):
        switch result {
        case .success(let characters):
            state.characters += characters
            print("number of characters: \(state.characters.count)")
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    return .none
}
