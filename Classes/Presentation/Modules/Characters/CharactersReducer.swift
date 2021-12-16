//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let charactersReducer = Reducer<CharactersState, CharactersAction, CharactersEnvironment> .combine(
    .init { state, action, environment in
        switch action {
        case .onAppear:
            if state.data.isEmpty {
                state.currentPageLoading = 1
                state.filterParameters.page = state.currentPageLoading
                return environment.apiService.fetchCharacters(withParameters: state.filterParameters)
                    .receive(on: environment.mainQueue)
                    .catchToEffect()
                    .map(CharactersAction.dataLoaded)
            }
        case .fetchAnotherPage:
            state.currentPageLoading += 1
            state.filterParameters.page = state.currentPageLoading
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
                state.totalPages = characters.info.pages
                state.totalPagesForFilter = state.totalPages
                state.data += characters.results
                state.filteredData = state.data
                state.grid.removeAll()
                print("number of characters: \(state.data.count)")
                for row in stride(from: 0, to: state.data.count, by: 2) where row != state.data.count {
                    state.grid.append(row)
                }
                print("number of rows for grid: \(state.grid.count)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        case .characterCardSelected(let character):
            state.details.character = character
            print("character \(character.name) selected")
        case .searchInputChanged(let request):
            state.searchRequest = request
            print("searching character: \(state.searchRequest)")
        case .details(let character):
            break
        }
        return .none
    },

    characterDetailsReducer.pullback(state: \.details, action: /CharactersAction.details) { _ in
        CharacterDetailsEnvironment(
            apiService: ServiceContainer().episodesService,
            apiServiceLocation: ServiceContainer().locationsService,
            mainQueue: DispatchQueue.main.eraseToAnyScheduler()
        )
    }
)
