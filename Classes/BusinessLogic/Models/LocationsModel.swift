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
        case reality = "Reality"
        case spacecraft = "Spacecraft"
        case country = "Country"
        case teenyverse = "Teenyverse"
        case cluster = "Cluster"
        case woods = "Woods"
        case space = "Space"
        case customs = "Customs"
        case dimension = "Dimension"
        case base = "Base"
        case consciousness = "Consciousness"
        case microverse = "Microverse"
        case nonDiegeticAltReality = "Non-Diegetic Alternative Reality"
        case arcade = "Arcade"
        case policeDepartment = "Police Department"
        case convention = "Convention"
        case tvType = "TV"
        case miniverse = "Miniverse"
        case deathStar = "Death Star"
        case mount = "Mount"
        case asteroid = "Asteroid"
        case fantasyTown = "Fantasy town"
        case spa = "Spa"
        case menagerie = "Menagerie"
        case dwarfPlanet = "Dwarf planet (Celestial Dwarf)"
        case liquid = "Liquid"
        case artGenWorld = "Artificially generated world"
        case spaceStation = "Space station"
        case game = "Game"
        case quadrant = "Quadrant"
        case human = "Human"
        case machine = "Machine"
        case resort = "Resort"
        case box = "Box"
        case planet = "Planet"
        case dream = "Dream"
        case hell = "Hell"
        case memory = "Memory"
        case daycare = "Daycare"
        case nightmare = "Nightmare"
        case elementalRings = "Elemental Rings"
        case diegesis = "Diegesis"
        case acidPlant = "Acid Plant"
        case quasar = "Quasar"
        case emptyType = ""
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
