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
                var id = episode.components(separatedBy: "episode/")
                guard let index = Int(id[1]) else {
                    return
                }
                print(index)
                state.indicies.append(index)
            }
            return environment.apiService.fetchMultipleEpisodes(withIds: state.indicies)
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(CharacterDetailsAction.dataLoaded)
        }
    case .dataLoaded(let result):
        switch result {
        case .success(let episodes):
            episodes.forEach { episode in
                print("id #\(episode.id), \(episode.name)")
            }
            state.episodes += episodes
            print("number of episodes: \(state.episodes.count)")
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    return .none
}
