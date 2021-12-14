//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let filterReducer = Reducer<FilterState, FilterAction, FilterEnvironment> { state, action, _ in
    switch action {
    case .onAppear:
        state.countOfSelected = 0
        state.tempFilterParams.removeAll()
        state.appliedParams.removeAll()
    case .resetAll:
        state.resetAll.toggle()
    case .countOfSelectedChanged(let newCount):
        state.countOfSelected = newCount
    case .filterParamsChanged(let newDict):
        state.tempFilterParams = newDict
    case .applyFilter:
        state.appliedParams = state.tempFilterParams
    case .onDisappear:
        state.appliedParams.removeAll()
    }
    return .none
}
