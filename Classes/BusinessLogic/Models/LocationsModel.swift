//
//  Created by Nikita Gavrikov on 28.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation

struct Locations: Decodable {
    let info: LocationsInfo
    let results: [LocationsModel]
}

struct LocationsInfo: Decodable {
    let count, pages: Int
    let next, prev: String?
}

struct LocationsModel: Decodable, Equatable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}

let locationCardModel = LocationsModel(
    id: 1,
    name: "Testicle Monster Dimension",
    type: "Cluster",
    dimension: "1",
    residents: ["1"],
    url: "1",
    created: "1"
)

let listLocations:[LocationsModel] = Array(repeating: locationCardModel, count: 6)
