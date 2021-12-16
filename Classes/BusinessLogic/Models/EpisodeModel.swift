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
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case characters
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
}

let dummyEpisodesArray: [Episode] = [
    Episode(
        id: 11,
        name: "Ricksy Business",
        date: "April 14, 2014",
        episodeCode: "S01E11",
        characters: [],
        url: "https://rickandmortyapi.com/api/episode/11",
        created: "2017-11-10T12:56:34.850Z"
    ),
    Episode(
        id: 1,
        name: "Pilot",
        date: "December 2, 2013",
        episodeCode: "S01E01",
        characters: [],
        url: "https://rickandmortyapi.com/api/episode/1",
        created: "2017-11-10T12:56:33.798Z"
    ),
    Episode(
        id: 39,
        name: "The Vat of Acid Episode",
        date: "May 17, 2020",
        episodeCode: "S04E08",
        characters: [],
        url: "https://rickandmortyapi.com/api/episode/39",
        created: "2020-08-06T05:51:07.419Z"
    ),
    Episode(
        id: 45,
        name: "Rickdependence Spray",
        date: "July 11, 2021",
        episodeCode: "S05E04",
        characters: [],
        url: "https://rickandmortyapi.com/api/episode/45",
        created: "2021-10-15T17:00:24.103Z"
    )
]
