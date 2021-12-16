//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let filterReducer = Reducer<FilterState, FilterAction, FilterEnvironment> { state, action, _ in
    switch action {
    case .onAppear:
        state.appliedParameters = state.filterParameters
    case .countOfSelectedChanged(let newCount):
        state.countOfSelected = newCount
        if state.countOfSelected == 0 {
            state.filterParameters = FetchingParameters(page: 1)
        }
    case .indicesOfCharactersChanged(let newArray):
        state.indicesOfCharactersFilter = newArray
    case .indicesOfLocationsChanged(let newArray):
        state.indicesOfLocationsFilter = newArray
    case .filterParametersChanged(let appliedParameters):
        state.appliedParameters = appliedParameters
    case .applyFilter:
        state.filterParameters = state.appliedParameters
    case .onDisappear:
        if state.filterParameters != state.appliedParameters {
            state.countOfSelected = 0
            state.indicesOfCharactersFilter = Array(repeating: nil, count: FilterState.CharactersFilter.allCases.count)
            state.indicesOfLocationsFilter = Array(repeating: nil, count: FilterState.LocationsFilter.allCases.count)
        }
    }
    return .none
}
