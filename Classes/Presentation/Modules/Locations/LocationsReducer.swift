//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let locationsReducer = Reducer<LocationsState, LocationsAction, LocationsEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
        if state.data.isEmpty {
            state.currentPageLoading = 1
            state.filterParameters.page = state.currentPageLoading
            return environment.apiService.fetchLocations(withParameters: state.filterParameters)
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(LocationsAction.dataLoaded)
        }
    case .fetchAnotherPage:
        state.currentPageLoading += 1
        state.filterParameters.page = state.currentPageLoading
        return environment.apiService.fetchLocations(withParameters: state.filterParameters)
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(LocationsAction.dataLoaded)
    case .dataLoaded(let result):
        switch result {
        case .success(let locations):
            print("число локаций: \(locations.results.count)")
            locations.results.forEach { location in
                print("id #\(location.id), \(location.name) (with type \(location.type.rawValue))")
            }
            state.totalPages = locations.info.pages
            state.totalPagesForFilter = state.totalPages
            state.data += locations.results
            state.filteredData = state.data
        case .failure(let error):
            print(error)
            print(error.localizedDescription)
        }
    case .locationCardSelected(let location):
        print("location \(location.name) selected")
    case .searchInputChanged(let request):
        state.searchRequest = request
        print("searching location: \(state.searchRequest)")
    }
    return .none
}
