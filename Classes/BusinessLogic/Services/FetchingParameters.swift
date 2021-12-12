//
//  Created by Александр Васильевич on 11.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation

struct FetchingParameters {
    // MARK: - Common params
    var page: Int // currnetPage
    var type: String?
    var name: String?

    // MARK: - Character
    var status: String? // Alive, Dead, Unknown
    var species: String?
    var gender: String? // Female, Male, Genderless, Unknown

    // MARK: - Locations
    var dimension: String?

    // MARK: - Episodes
    var episode: Int?
}
