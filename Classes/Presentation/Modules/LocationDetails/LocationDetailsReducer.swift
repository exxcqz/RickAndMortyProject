//
//  Created by Nikita Gavrikov on 12/12/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let locationDetailsReducer = Reducer<LocationDetailsState, LocationDetailsAction, LocationDetailsEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
        if state.characters.isEmpty {
            state.currentPageLoading = 1
            state.filterParameters.page = state.currentPageLoading
            state.location.residents.forEach { resident in
                var id = resident.components(separatedBy: "ter/")
                guard let index = Int(id[1]) else {
                    return
                }
                state.indicies.append(index)
            }
            return environment.apiService.fetchMultipleCharacters(withIds: state.indicies)
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(LocationDetailsAction.dataLoaded)
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
