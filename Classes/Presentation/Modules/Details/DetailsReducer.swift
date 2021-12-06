//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let detailsReducer = Reducer<DetailsState, DetailsAction, DetailsEnvironment> { state, action, environment in
    switch action {
    case .selectedDetailsChange(let details):
        state.selectedDetails = details
    }
    return .none
}
