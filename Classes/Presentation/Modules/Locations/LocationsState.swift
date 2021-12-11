//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

struct LocationsState: Equatable {
    let navigationImage: String = Asset.Illustrations.locations.name
    let navigationTitle: String = L10n.Locations.title
    var data: [Location] = []
    var filteredData: [Location] = []
    var currentPageLoading: Int = 1
    var totalPages: Int = 0
    var totalPagesForFilter: Int = 0
    var isFiltering: Bool = false
    var searchRequest: String = ""
}
