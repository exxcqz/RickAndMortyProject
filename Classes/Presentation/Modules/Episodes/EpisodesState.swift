//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

struct EpisodesState: Equatable {
    var data: [EpisodeModel] = []
    var filtredData: [EpisodeModel] = []
    var seasonsNumberArray: [Int] = []
    var filtredSeasonsNumberArray: [Int] = []
    var selectedSeasonIndex: Int = 0
    var seasonsTitles: [String] = ["All"]
    var searchingRequest: String = ""
    var isSearching: Bool = false
}
