//
//  Created by Alexander Loshakov on 02.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation

struct Episode: Codable, Equatable {
    let id: Int
    let name: String
    let date: String
    let episodeCode: String
    let characterURLs: [URL]
    let url: String
    let created: String
    var characters: [Character] = []

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case characterURLs = "characters"
        case url
        case created
        case date = "air_date"
        case episodeCode = "episode"
    }

    var convertedEpisodeCode: (episodeNumber: Int, seasonNumber: Int)? {
        guard let indexOfSeasonCode = episodeCode.firstIndex(of: "S"),
              let indexOfEpisodeCode = episodeCode.firstIndex(of: "E") else {
                  return nil
              }
        let seasonCodeRange = episodeCode.index(indexOfSeasonCode, offsetBy: 1)..<indexOfEpisodeCode
        let episodeCodeRange = episodeCode.index(indexOfEpisodeCode, offsetBy: 1)...
        guard let seasonNumber = Int(episodeCode[seasonCodeRange]),
              let episodeNumber = Int(episodeCode[episodeCodeRange]) else {
                  return nil
              }
        return (episodeNumber, seasonNumber)
    }

    var charactersIDs: [Int] {
        return characterURLs.compactMap { Int($0.lastPathComponent) }
    }
}

let dummyEpisodesArray: [Episode] = [
    Episode(
        id: 11,
        name: "Ricksy Business",
        date: "April 14, 2014",
        episodeCode: "S01E11",
        characterURLs: [],
        url: "https://rickandmortyapi.com/api/episode/11",
        created: "2017-11-10T12:56:34.850Z",
        characters: []
    )
]
