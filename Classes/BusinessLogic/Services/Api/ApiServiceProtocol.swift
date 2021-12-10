//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import ComposableArchitecture

protocol HasApiService {
    var profileService: ApiServiceProtocol { get }
}

protocol ApiServiceProtocol: AnyObject {
    func fetchAllCharacters(currentPage: Int) -> Effect<GeneralRequest<Character>, NetworkError>
    func fetchFilteredCharacters(currentPage: Int, filterParam: [String], filterValue: [String]) -> Effect<GeneralRequest<Character>, NetworkError>
    func fetchSingleCharacter(withId: Int) -> Effect<Character, NetworkError>
    func fetchMultipleCharacters(withIds: [Int]) -> Effect<[Character], NetworkError>

    func fetchAllLocations(currentPage: Int) -> Effect<GeneralRequest<Location>, NetworkError>
    func fetchFilteredLocations(currentPage: Int, filterParam: [String], filterValue: [String]) -> Effect<GeneralRequest<Location>, NetworkError>
    func fetchSingleLocation(withId: Int) -> Effect<Location, NetworkError>
    func fetchMultipleLocations(withIds: [Int]) -> Effect<[Location], NetworkError>

    func fetchAllEpisodes(currentPage: Int) -> Effect<GeneralRequest<Episode>, NetworkError>
    func fetchFilteredEpisodes(seasonNumber: Int) -> Effect<GeneralRequest<Episode>, NetworkError>
    func fetchSingleEpisode(withId: Int) -> Effect<Episode, NetworkError>
    func fetchMultipleEpisodes(withIds: [Int]) -> Effect<[Episode], NetworkError>
}
