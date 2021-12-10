//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let charactersReducer = Reducer<CharactersState, CharactersAction, CharactersEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
        if state.data.isEmpty {
            return environment.apiService.fetchAllCharacters(currentPage: state.currentPageLoading)
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(CharactersAction.dataLoaded)
        }
    case .fetchAnotherPage:
        state.currentPageLoading += 1
        return environment.apiService.fetchAllCharacters(currentPage: state.currentPageLoading)
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(CharactersAction.dataLoaded)
    case .dataLoaded(let result):
        switch result {
        case .success(let characters):
//            characters.results.enumerated().forEach { (index, character) in
//                print("#\(index + 1): id\(character.id), \(character.name) (with type \(character.type))")
//            }
            state.totalPages = characters.info.pages
            state.data += characters.results
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
        print("character \(character.name) selected")
    case .searchInputChanged(let request):
        state.searchRequest = request
        print("searching character: \(state.searchRequest)")
    }
    return .none
}
