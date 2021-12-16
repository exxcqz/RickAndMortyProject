//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let charactersReducer: Reducer<CharactersState, CharactersAction, CharactersEnvironment> = .combine(
    .init { state, action, environment in
        switch action {
        case .onAppear:
            if state.data.isEmpty {
                return environment.apiService.fetchCharacters(withParameters: state.filterParameters)
                    .receive(on: environment.mainQueue)
                    .catchToEffect()
                    .map(CharactersAction.dataLoaded)
            }
        case .fetchNextPage:
            state.filterParameters.page += 1
            return environment.apiService.fetchCharacters(withParameters: state.filterParameters)
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(CharactersAction.dataLoaded)
        case .dataLoaded(let result):
            switch result {
            case .success(let characters):
                characters.results.forEach { character in
                    print("id #\(character.id), \(character.name) (with gender \(character.gender))")
                }
                state.filterParameters.totalPages = characters.info.pages
                state.data += characters.results
                state.logInfo = nil
                print("number of characters: \(state.data.count)")
            case .failure(let error):
                print(error.localizedDescription)
                state.logInfo = error
            }
        case .characterCardSelected(let character):
            print("character \(character.name) selected")
        case .searchInputChanged(let request):
            print("searching character: \(request ?? "nil")")
            state.filterParameters.name = request
            state.filterParameters.page = 1
            state.filterParameters.totalPages = 0
            state.data.removeAll()
            return environment.apiService.fetchCharacters(withParameters: state.filterParameters)
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(CharactersAction.dataLoaded)
        case .filterSettingsChanged:
            state.filterParameters = state.filter.filterParameters
            state.data.removeAll()
            return environment.apiService.fetchCharacters(withParameters: state.filterParameters)
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(CharactersAction.dataLoaded)
        case .filter(let action):
            switch action {
            case .applyFilter:
                state.isFilterPresented = false
                state.isFilterButtonActive = false
            case .onDisappear:
                state.isFilterPresented = false
                state.isFilterButtonActive = false
            default:
                break
            }
        case .filterButtonTapped:
            state.isFilterButtonActive = true
            state.isFilterPresented = true
            state.filterParameters.page = 1
            state.filterParameters.totalPages = 0
            state.filter.filterParameters = state.filterParameters
        }
        return .none
    },

    filterReducer.pullback(state: \.filter, action: /CharactersAction.filter) { _ in
        FilterEnvironment()
    }
)
