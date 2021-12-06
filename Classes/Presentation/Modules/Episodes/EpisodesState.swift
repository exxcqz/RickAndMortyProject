//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

struct EpisodesState: Equatable {
    let navigationImage: String = Asset.Illustrations.episodes.name
    let navigationTitle: String = L10n.Episodes.title
    var data: [Episode] = []
    var filteredData: [Episode] = []
    var seasonsNumberArray: [Int] = []
    var filteredSeasonsNumberArray: [Int] = []
    var selectedSeasonIndex: Int = 0
    var seasonsTitles: [String] = ["All"]
    var searchRequest: String = ""
}
