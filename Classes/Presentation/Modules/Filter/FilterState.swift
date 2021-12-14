//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

struct FilterState: Equatable {
    var filterType: FilterType = FilterType.locations
    var countOfSelected: Int = 0
    var resetAll: Bool = false
    var tempFilterParams: [String: String] = [:]
    var appliedParams: [String: String] = [:]

    enum FilterType: CaseIterable {
        case characters
        case locations
    }

    enum CharacterFilter: String, CaseIterable {
        case status = "Status"
        case species = "Species"
        case type = "Type"
        case gender = "Gender"
    }

    enum LocationsFilter: String, CaseIterable {
        case type = "Type"
        case dimension = "Dimension"
    }
}
