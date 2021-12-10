//
//  Created by Nikita Gavrikov on 28.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import UIKit

struct Location: Codable, Equatable {
    let id: Int
    let name: String
    let type: LocationType
    let dimension: String
    let residents: [String]
    let url: String
    let created: String

    init(id: Int, name: String, type: LocationType, dimension: String, residents: [String], url: String, created: String) {
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.residents = residents
        self.url = url
        self.created = created
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        dimension = try values.decode(String.self, forKey: .dimension)
        residents = try values.decode([String].self, forKey: .residents)
        url = try values.decode(String.self, forKey: .url)
        created = try values.decode(String.self, forKey: .created)

        let strValue = try values.decode(String.self, forKey: .type)
        switch strValue {
        case "Planet":
            type = LocationType.planet(value: strValue)
        case "Cluster":
            type = LocationType.cluster(value: strValue)
        case "Space station":
            type = LocationType.spaceStation(value: strValue)
        case "Microverse":
            type = LocationType.microverse(value: strValue)
        case "TV":
            type = LocationType.tvType(value: strValue)
        case "Resort":
            type = LocationType.resort(value: strValue)
        case "Fantasy town":
            type = LocationType.fantasyTown(value: strValue)
        case "Dream":
            type = LocationType.dream(value: strValue)
        default:
            type = LocationType.unknown(value: strValue)
        }
    }

    enum LocationType: Codable, Equatable {
        case planet(value: String)
        case cluster(value: String)
        case spaceStation(value: String)
        case microverse(value: String)
        case tvType(value: String)
        case resort(value: String)
        case fantasyTown(value: String)
        case dream(value: String)
        case unknown(value: String)

//        public init(from decoder: Decoder) throws {
//            self = try LocationType(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
//        }

        var rawValue: String {
            switch self {
            case .planet(value: let value):
                return value
            case .cluster(value: let value):
                return value
            case .spaceStation(value: let value):
                return value
            case .microverse(value: let value):
                return value
            case .tvType(value: let value):
                return value
            case .resort(value: let value):
                return value
            case .fantasyTown(value: let value):
                return value
            case .dream(value: let value):
                return value
            case .unknown(let value):
                return value
            }
        }

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
            case .unknown:
                return Asset.Icons.icStar.image
            }
        }
    }
}



let locationCardModel = Location(
    id: 1,
    name: "Testicle Monster Dimension",
    type: .cluster(value: "Cluster"),
    dimension: "1",
    residents: ["1"],
    url: "1",
    created: "1"
)

let listLocations: [Location] = Array(repeating: locationCardModel, count: 20)


//enum LocationType: Equatable {
//    case planet
//    case cluster
//    case spaceStation
//    case microverse
//    case tvType
//    case resort
//    case fantasyTown
//    case dream
//    case unknown(String)
//
//    // Make this private
//    private enum RawValues: String, Codable {
//        case planet = "Planet"
//        case cluster = "Cluster"
//        case spaceStation = "Space station"
//        case microverse = "Microverse"
//        case tvType = "TV"
//        case resort = "Resort"
//        case fantasyTown = "Fantasy town"
//        case dream = "Dream"
//        // No such case here for the unknowns
//    }
//
//    var icon: UIImage {
//        switch self {
//        case .planet:
//            return Asset.Icons.icPlanet.image
//        case .cluster:
//            return Asset.Icons.icCluster.image
//        case .spaceStation:
//            return Asset.Icons.icSpaceStation.image
//        case .microverse:
//            return Asset.Icons.icMicroverse.image
//        case .tvType:
//            return Asset.Icons.icTV.image
//        case .resort:
//            return Asset.Icons.icResort.image
//        case .fantasyTown:
//            return Asset.Icons.icFantasyTown.image
//        case .dream:
//            return Asset.Icons.icDream.image
//        case .unknown:
//            return Asset.Icons.icStar.image
//        }
//    }
//}
//}
//
//extension Location.LocationType: Decodable {
//init(from decoder: Decoder) throws {
//    let container = try decoder.singleValueContainer()
//    // As you already know your RawValues is String actually, you decode String here
//    let stringForRawValues = try container.decode(String.self)
//    // This is the trick here...
//    switch stringForRawValues {
//    // Now You can switch over this String with cases from RawValues since it is String
//    case RawValues.planet.rawValue:
//        self = .planet
//    case RawValues.cluster.rawValue:
//        self = .cluster
//    case RawValues.spaceStation.rawValue:
//        self = .spaceStation
//    case RawValues.microverse.rawValue:
//        self = .microverse
//    case RawValues.tvType.rawValue:
//        self = .tvType
//    case RawValues.resort.rawValue:
//        self = .resort
//    case RawValues.fantasyTown.rawValue:
//        self = .fantasyTown
//    case RawValues.dream.rawValue:
//        self = .dream
//    // Now handle all unknown types. You just pass the String to Type's unknown case.
//    // And this is true for every other unknowns that aren't defined in your RawValues
//    default:
//        self = .unknown(stringForRawValues)
//    }
//}
//}
//
//extension Location.LocationType: Encodable {
//func encode(to encoder: Encoder) throws {
//    var container = encoder.singleValueContainer()
//    switch self {
//    case .planet:
//        try container.encode(RawValues.planet)
//    case .cluster:
//        try container.encode(RawValues.cluster)
//    case .spaceStation:
//        try container.encode(RawValues.spaceStation)
//    case .microverse:
//        try container.encode(RawValues.microverse)
//    case .tvType:
//        try container.encode(RawValues.tvType)
//    case .resort:
//        try container.encode(RawValues.resort)
//    case .fantasyTown:
//        try container.encode(RawValues.fantasyTown)
//    case .dream:
//        try container.encode(RawValues.dream)
//
//    case .unknown(let string):
//        // You get the actual String here from the associated value and just encode it
//        try container.encode(string)
//    }
//}
//}
