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
    func fetchCharacters(currentPage: Int) -> Effect<GeneralRequest<Character>, NetworkError>
    func fetchSingleCharacter(withId: Int) -> Effect<Character, NetworkError>
    func fetchLocations(currentPage: Int) -> Effect<GeneralRequest<Location>, NetworkError>
    func fetchSingleLocation(withId: Int) -> Effect<Location, NetworkError>
    func fetchEpisodes(currentPage: Int) -> Effect<GeneralRequest<Episode>, NetworkError>
    func fetchSingleEpisode(withId: Int) -> Effect<Episode, NetworkError>
}
