//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

struct EpisodesState: Equatable {
    let navigationImage: String = Asset.Illustrations.episodes.name
    let navigationTitle: String = L10n.Episodes.title
    var data: [Episode] = []
    var filteredData: [Episode] = []
    var currentPageLoading: Int = 1
    var currentPageForAll: Int = 1
    var totalPages: Int = 0
    var totalPagesForFilter: Int = 0
    var isFiltering: Bool = false
    var filterParameters: FetchingParameters = FetchingParameters()
    var searchRequest: String = ""
    var seasonsSet = Set<Int>()
    var selectedSeasonIndex: Int = 0
    var seasonsTitles: [String] = [L10n.Filters.all]
    var seasonsNumberArray: [Int] = [1, 2, 3, 4, 5]
    var filteredSeasonsNumberArray: [Int] = []
}
