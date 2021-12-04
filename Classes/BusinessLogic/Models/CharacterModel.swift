//
//  Created by Александр Васильевич on 26.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation

// MARK: -  Request for all Characters
struct CharactersRequest: Decodable {
    let info: CharactersInfo
    let results: [CharacterModel]
}

// MARK: -  Info of request for all Characters
struct CharactersInfo: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

// MARK: -  Character Model
struct CharacterModel: Decodable, Equatable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: CharacterLocation
    let location: CharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: -  Substruct of Character Origin/Location
struct CharacterLocation: Decodable, Equatable {
    let name: String
    let url: String
}

// MARK: -  dummyModel of Character (Image is dummy too)
let dummyCharacterModel = CharacterModel(
    id: 1,
    name: "Rick Sanchez",
    status: "Alive",
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
)

let dummyCharactersArray: [CharacterModel] = Array(repeating: dummyCharacterModel, count: 9)
