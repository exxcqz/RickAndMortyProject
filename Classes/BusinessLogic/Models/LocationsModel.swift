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
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct LocationsModel: Decodable, Equatable {
    let id: Int
    let name: String
    let type: LocationsType
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}

enum LocationsType: String, Decodable {
    case planet = "Planet"
    case cluster = "Cluster"
    case spaceStation = "Space station"
    case microverse = "Microverse"
    case tvType = "TV"
    case resort = "Resort"
    case fantasyTown = "Fantasy town"
    case dream = "Dream"
}

let locationCardModel = LocationsModel(
    id: 1,
    name: "Testicle Monster Dimension",
    type: .cluster,
    dimension: "1",
    residents: ["1"],
    url: "1",
    created: "1"
)

let listLocations: [LocationsModel] = Array(repeating: locationCardModel, count: 20)
