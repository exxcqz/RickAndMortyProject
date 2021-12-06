//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let charactersReducer = Reducer<CharactersState, CharactersAction, CharactersEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
        state.data = dummyCharactersArray
        state.grid.removeAll()
        print("number of characters: \(state.data.count)")
        for row in stride(from: 0, to: state.data.count, by: 2) where row != state.data.count {
            state.grid.append(row)
        }
        print("number of rows for grid: \(state.grid.count)")
    case .characterCardSelected(let character):
        print("character \(character.name) selected")
    case .searchInputChanged(let request):
        state.searchRequest = request
        print("searching character: \(state.searchRequest)")
    }
    return .none
}
