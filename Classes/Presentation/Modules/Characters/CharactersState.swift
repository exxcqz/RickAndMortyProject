//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

struct CharactersState: Equatable {
    let navigationImage: String = Asset.Illustrations.characters.name
    let navigationTitle: String = L10n.Characters.title
    var data: [Character] = []
    var filteredData: [Character] = []
    var grid: [Int] = []
    var currentPageLoading: Int = 1
    var totalPages: Int = 0
    var totalPagesForFilter: Int = 0
    var isFiltering: Bool = false
    var filterParameters: FetchingParameters = FetchingParameters()
    var searchRequest: String = ""
    var details = CharacterDetailsState()
}
