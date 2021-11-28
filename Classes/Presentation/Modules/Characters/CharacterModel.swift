//
//  Created by Александр Васильевич on 26.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation

// MARK: - Request for all Characters
struct CharactersRequest: Decodable {
    let info: CharactersInfo?
    let results: [CharactersResult]?
}

// MARK: - Info
struct CharactersInfo: Decodable {
    let count, pages: Int?
    let next, prev: String?
}

// MARK: - Result
struct CharactersResult: Decodable, Equatable {
    var id: Int // The id of the character.
    let name: String
    let status: String // ('Alive', 'Dead' or 'unknown')
    let species: String // The species of the character
    let type: String // The type or subspecies of the character
    let gender: String // The gender of the character ('Female', 'Male', 'Genderless' or 'unknown')
    let origin: Location // Name and link to the character's origin location
    let location: Location // Name and link to the character's last known location endpoint
    let image: String // (url) - Link to the character's image
    let episode: [String] // (urls) - List of episodes in which this character appeared.
    let url: String // (url) - Link to the character's own URL endpoint.
    let created: String //  Time at which the character was created in the database.

    struct Location: Decodable, Equatable {
        let name: String
        let url: String
    }
}

typealias CharacterModel = CharactersResult

// MARK: - dummyModel
let dummyCharacterModel1 = CharacterModel(
    id: 1,
    name: "Rick Sanchez",
    status: "Alive",
    species: "Human",
    type: "",
    gender: "Male",
    origin: CharacterModel.Location(
        name: "Earth",
        url: "https://rickandmortyapi.com/api/location/1"
    ),
    location: CharacterModel.Location(
        name: "Earth",
        url: "https://rickandmortyapi.com/api/location/20"
    ),
    image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
    episode: [
        "https://rickandmortyapi.com/api/episode/1",
        "https://rickandmortyapi.com/api/episode/2"
    ],
    url: "https://rickandmortyapi.com/api/character/1",
    created: "2017-11-04T18:48:46.250Z"
)

let dummyCharactersArray: [CharacterModel] = [dummyCharacterModel1, dummyCharacterModel1, dummyCharacterModel1]
