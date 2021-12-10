//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

let locationsReducer = Reducer<LocationsState, LocationsAction, LocationsEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
        if state.data.isEmpty {
            //        environment.apiService.fetchFilteredLocations(currentPage: 1, filterParam: ["dimension"], filterValue: ["Dimension C-137"])
            return environment.apiService.fetchAllLocations(currentPage: state.currentPageLoading)
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(LocationsAction.dataLoaded)
        }
    case .fetchAnotherPage:
        state.currentPageLoading += 1
        return environment.apiService.fetchAllLocations(currentPage: state.currentPageLoading)
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(LocationsAction.dataLoaded)
    case .locationCardSelected(let location):
        print("Hello \(location.name)")
    case .searchInputChanged(let request):
        state.searchRequest = request
        print("searching location: \(state.searchRequest)")
    case .dataLoaded(let result):
        switch result {
        case .success(let locations):
            print("число локаций: \(locations.results.count)")
            locations.results.forEach { location in
                print("id #\(location.id), \(location.name) (with type \(location.type.rawValue))")
            }
            state.totalPages = locations.info.pages
            state.data += locations.results
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    return .none
}
