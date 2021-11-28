//
//  Created by Nikita Gavrikov on 28.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation

// MARK: - Locations
struct LocationsModel: Decodable {
    let info: LocationsInfo?
    let results: [LocationsResult]?
}

// MARK: - Info
struct LocationsInfo: Decodable {
    let count, pages: Int?
    let next, prev: String?
}

// MARK: - Result
struct LocationsResult: Decodable {
    let id: Int?
    let name, type, dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}

typealias LocationsCardModel = LocationsResult
