//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let charactersReducer = Reducer<CharactersState, CharactersAction, CharactersEnvironment> { state, action, environment in
    // The function of a reducer depends on the given action.
    switch action {
    case .onAppear:
        state.data = dummyCharactersArray
        print("data count = \(state.data.count)")
        for row in stride(from: 0, to: state.data.count, by: 2) where row != state.data.count {
            state.grid.append(row)
        }
        print("grid count = \(state.grid.count)")
    case .characterCardTapped(let character): break
    }
    return .none
}
