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

    enum LocationType: String, Codable, Equatable {
        case acidPlant = "Acid Plant"
        case arcade = "Arcade"
        case artGenWorld = "Artificially generated world"
        case asteroid = "Asteroid"
        case base = "Base"
        case box = "Box"
        case cluster = "Cluster"
        case consciousness = "Consciousness"
        case convention = "Convention"
        case country = "Country"
        case customs = "Customs"
        case daycare = "Daycare"
        case deathStar = "Death Star"
        case diegesis = "Diegesis"
        case dimension = "Dimension"
        case dream = "Dream"
        case dwarfPlanet = "Dwarf planet (Celestial Dwarf)"
        case elementalRings = "Elemental Rings"
        case fantasyTown = "Fantasy town"
        case game = "Game"
        case hell = "Hell"
        case human = "Human"
        case liquid = "Liquid"
        case machine = "Machine"
        case memory = "Memory"
        case menagerie = "Menagerie"
        case microverse = "Microverse"
        case miniverse = "Miniverse"
        case mount = "Mount"
        case nightmare = "Nightmare"
        case nonDiegeticAltReality = "Non-Diegetic Alternative Reality"
        case planet = "Planet"
        case policeDepartment = "Police Department"
        case quadrant = "Quadrant"
        case quasar = "Quasar"
        case reality = "Reality"
        case resort = "Resort"
        case spa = "Spa"
        case space = "Space"
        case spaceStation = "Space station"
        case spacecraft = "Spacecraft"
        case tvType = "TV"
        case teenyverse = "Teenyverse"
        case woods = "Woods"
        case empty = ""
        case unknown = "unknown"
        case other = "some other type"

        public init(from decoder: Decoder) throws {
            self = try LocationType(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .other
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
            default:
                return Asset.Icons.icStar.image
            }
        }
    }
}

let locationCardModel = Location(
    id: 1,
    name: "Earth (Replacement Dimension)",
    type: .cluster,
    dimension: "1",
    residents: ["1"],
    url: "1",
    created: "1"
)

let listLocations: [Location] = Array(repeating: locationCardModel, count: 20)
