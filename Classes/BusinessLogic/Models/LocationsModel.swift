//
//  Created by Nikita Gavrikov on 28.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import UIKit

struct Location: Decodable, Equatable {
    let id: Int
    let name: String
    let type: LocationType
    let dimension: String
    let residents: [String]
    let url: String
    let created: String

    enum LocationType: String, Decodable {
        case planet = "Planet"
        case cluster = "Cluster"
        case spaceStation = "Space station"
        case microverse = "Microverse"
        case tvType = "TV"
        case resort = "Resort"
        case fantasyTown = "Fantasy town"
        case dream = "Dream"

        var icon: UIImage {
            switch self {
            case .planet:
                return Asset.Icons.icPlanet.image
            case .cluster:
                return Asset.Icons.icCluster.image
            case .spaceStation:
                return Asset.Icons.icSpaceStation.image
            case .microverse:
                return Asset.Icons.icMicroverse.image
            case .tvType:
                return Asset.Icons.icTV.image
            case .resort:
                return Asset.Icons.icResort.image
            case .fantasyTown:
                return Asset.Icons.icFantasyTown.image
            case .dream:
                return Asset.Icons.icDream.image
            }
        }
    }
}

let locationCardModel = Location(
    id: 1,
    name: "Testicle Monster Dimension",
    type: .cluster,
    dimension: "1",
    residents: ["1"],
    url: "1",
    created: "1"
)

let listLocations: [Location] = Array(repeating: locationCardModel, count: 20)
