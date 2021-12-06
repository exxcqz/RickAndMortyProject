//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

let locationsReducer = Reducer<LocationsState, LocationsAction, LocationsEnvironment> { state, action, environment in
    switch action {
    case .updateLocationsData:
        state.locationsData = listLocations
    case .didOpenLocationDetails(let location):
        print("Hello \(location.name)")
    case .searchInputChanged(let request):
        state.searchRequest = request
        print("searching location: \(state.searchRequest)")
    }
    return .none
}
