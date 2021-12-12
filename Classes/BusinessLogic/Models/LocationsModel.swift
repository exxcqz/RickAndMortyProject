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
    dimension: "C-137",
    residents: ["1"],
    url: "1",
    created: "1"
)

let listLocations: [Location] = Array(repeating: locationCardModel, count: 20)

let locationData = [
    Location(
        id: 1,
        name: "hey",
        type: .microverse,
        dimension: "C-137",
        residents: ["1"],
        url: "1",
        created: "1"
    ),
    Location(
        id: 2,
        name: "Testicle Monster Dimension",
        type: .cluster,
        dimension: "C-13qqq7",
        residents: ["1"],
        url: "1",
        created: "1"
    ),
    Location(
        id: 3,
        name: "Planet",
        type: .fantasyTown,
        dimension: "C-aa137",
        residents: ["1"],
        url: "1",
        created: "1"
    ),
    Location(
        id: 4,
        name: "Kek",
        type: .planet,
        dimension: "C-1111212137",
        residents: ["1"],
        url: "1",
        created: "1"
    ),
    Location(
        id: 5,
        name: "safsffsa",
        type: .dream,
        dimension: "keee",
        residents: ["1"],
        url: "1",
        created: "1"
    )]

let characterData = [
    Character(
        id: 1,
        name: "RKee",
        status: "Aaaalive",
        species: "Hqquman",
        type: "",
        gender: "Maaale",
        origin: CharacterLocation(
            name: "Earth",
            url: "https://rickandmortyapi.com/api/location/1"
        ),
        location: CharacterLocation(
            name: "Earth",
            url: "https://rickandmortyapi.com/api/location/20"
        ),
        image: Asset.Illustrations.dummyCharacterIllustration.name,
        episode: [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2"
        ],
        url: "https://rickandmortyapi.com/api/character/1",
        created: "2017-11-04T18:48:46.250Z"
    ),
    Character(
        id: 2,
        name: "Riqqck Sanchez",
        status: "Aliaave",
        species: "Humxxan",
        type: "",
        gender: "Male",
        origin: CharacterLocation(
            name: "Earth",
            url: "https://rickandmortyapi.com/api/location/1"
        ),
        location: CharacterLocation(
            name: "Earth",
            url: "https://rickandmortyapi.com/api/location/20"
        ),
        image: Asset.Illustrations.dummyCharacterIllustration.name,
        episode: [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2"
        ],
        url: "https://rickandmortyapi.com/api/character/1",
        created: "2017-11-04T18:48:46.250Z"
    ),
    Character(
        id: 3,
        name: "Riczzk Sancaahez",
        status: "Aliaaave",
        species: "Humaggn",
        type: "",
        gender: "Maggle",
        origin: CharacterLocation(
            name: "Earth",
            url: "https://rickandmortyapi.com/api/location/1"
        ),
        location: CharacterLocation(
            name: "Earth",
            url: "https://rickandmortyapi.com/api/location/20"
        ),
        image: Asset.Illustrations.dummyCharacterIllustration.name,
        episode: [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2"
        ],
        url: "https://rickandmortyapi.com/api/character/1",
        created: "2017-11-04T18:48:46.250Z"
    ),
    Character(
        id: 4,
        name: "Ricaaak Sanaaachez",
        status: "Ali111ve",
        species: "Hu22man",
        type: "",
        gender: "Male",
        origin: CharacterLocation(
            name: "Earth",
            url: "https://rickandmortyapi.com/api/location/1"
        ),
        location: CharacterLocation(
            name: "Earth",
            url: "https://rickandmortyapi.com/api/location/20"
        ),
        image: Asset.Illustrations.dummyCharacterIllustration.name,
        episode: [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2"
        ],
        url: "https://rickandmortyapi.com/api/character/1",
        created: "2017-11-04T18:48:46.250Z"
    ),
    Character(
        id: 5,
        name: "R11ick San333chez",
        status: "Aliaave",
        species: "Huaman",
        type: "",
        gender: "Male",
        origin: CharacterLocation(
            name: "Earth",
            url: "https://rickandmortyapi.com/api/location/1"
        ),
        location: CharacterLocation(
            name: "Earth",
            url: "https://rickandmortyapi.com/api/location/20"
        ),
        image: Asset.Illustrations.dummyCharacterIllustration.name,
        episode: [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2"
        ],
        url: "https://rickandmortyapi.com/api/character/1",
        created: "2017-11-04T18:48:46.250Z"
    ),
    Character(
        id: 6,
        name: "Rick Saaddanchez",
        status: "Aliveda",
        species: "Human",
        type: "",
        gender: "Male",
        origin: CharacterLocation(
            name: "Earth",
            url: "https://rickandmortyapi.com/api/location/1"
        ),
        location: CharacterLocation(
            name: "Earth",
            url: "https://rickandmortyapi.com/api/location/20"
        ),
        image: Asset.Illustrations.dummyCharacterIllustration.name,
        episode: [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2"
        ],
        url: "https://rickandmortyapi.com/api/character/1",
        created: "2017-11-04T18:48:46.250Z"
    ),
    Character(
        id: 7,
        name: "Rickdada Sanchez",
        status: "daaaa",
        species: "Humaaaan",
        type: "",
        gender: "Malaae",
        origin: CharacterLocation(
            name: "Earth",
            url: "https://rickandmortyapi.com/api/location/1"
        ),
        location: CharacterLocation(
            name: "Earth",
            url: "https://rickandmortyapi.com/api/location/20"
        ),
        image: Asset.Illustrations.dummyCharacterIllustration.name,
        episode: [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2"
        ],
        url: "https://rickandmortyapi.com/api/character/1",
        created: "2017-11-04T18:48:46.250Z"
    ),
    Character(
        id: 8,
        name: "Rick Saaaanchez",
        status: "aaa",
        species: "Human",
        type: "",
        gender: "Male",
        origin: CharacterLocation(
            name: "Earth",
            url: "https://rickandmortyapi.com/api/location/1"
        ),
        location: CharacterLocation(
            name: "Earth",
            url: "https://rickandmortyapi.com/api/location/20"
        ),
        image: Asset.Illustrations.dummyCharacterIllustration.name,
        episode: [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2"
        ],
        url: "https://rickandmortyapi.com/api/character/1",
        created: "2017-11-04T18:48:46.250Z"
    )]
