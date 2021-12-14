//
//  Created by Nikita Gavrikov on 12/12/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let characterDetailsReducer = Reducer<CharacterDetailsState, CharacterDetailsAction, CharacterDetailsEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
        if state.episodes.isEmpty {
            state.character.episode.forEach { episode in
                let urlEpisode = URL(string: episode)
                let lastPath = urlEpisode?.lastPathComponent
                guard let idString = lastPath, let id = Int(idString) else {
                    return
                }
                state.indicies.append(id)
            }
            return environment.apiService.fetchMultipleEpisodes(withIds: state.indicies)
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(CharacterDetailsAction.dataLoaded)
        }
    case .dataLoaded(let result):
        switch result {
        case .success(let episodes):
            state.episodes += episodes
            print("number of episodes: \(state.episodes.count)")
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    return .none
}
