//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

let locationsReducer = Reducer<LocationsState, LocationsAction, LocationsEnvironment> { state, action, environment in
    switch action {
    case .updateLocationsData:
//        state.locationsData = listLocations
        return environment.apiService.fetchLocations(currentPage: 2)
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(LocationsAction.dataLoaded)
    case .didOpenLocationDetails(let location):
        print("Hello \(location.name)")
    case .searchInputChanged(let request):
        state.searchRequest = request
        print("searching location: \(state.searchRequest)")
    case .dataLoaded(let result):
        switch result {
        case .success(let locations):
            print("число локаций: \(locations.results.count)")
            locations.results.enumerated().forEach { (index, location) in
                print("#\(index + 1): \(location.name)")
            }
            state.locationsData = locations.results
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    return .none
}
