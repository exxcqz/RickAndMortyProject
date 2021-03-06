//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

struct FilterState: Equatable {
    var filterType: FilterType = FilterType.locations
    var countOfSelected: Int = 0
    var resetAll: Bool = false
    var indicesOfCharactersFilter: [Int?] = Array(repeating: nil, count: CharactersFilter.allCases.count)
    var indicesOfLocationsFilter: [Int?] = Array(repeating: nil, count: LocationsFilter.allCases.count)
    var filterParameters: FetchingParameters = FetchingParameters()
    var appliedParameters: FetchingParameters = FetchingParameters()

    enum FilterType: CaseIterable {
        case characters
        case locations
    }

    enum CharactersFilter: CaseIterable {
        case status
        case species
        case type
        case gender

        var value: String {
            switch self {
            case .status:
                return L10n.Filters.Characters.status
            case .species:
                return L10n.Filters.Characters.species
            case .type:
                return L10n.Filters.Characters.type
            case .gender:
                return L10n.Filters.Characters.gender
            }
        }
    }

    enum LocationsFilter: CaseIterable {
        case type
        case dimension

        var value: String {
            switch self {
            case .type:
                return L10n.Filters.Locations.type
            case .dimension:
                return L10n.Filters.Locations.dimension
            }
        }
    }
}
