//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Combine
import ComposableArchitecture
import Networking

final class ApiService: ApiServiceProtocol {
    // MARK: -  Characters methods
    func fetchAllCharacters(currentPage: Int) -> Effect<GeneralRequest<Character>, NetworkError> {
        let request = makeRequest {
            ApiEndpoint.fetchAllCharacters(currentPage)
        }
        return requestWithEffect(request)
    }

    func fetchFilteredCharacters(currentPage: Int, filterParam: [String], filterValue: [String]) -> Effect<GeneralRequest<Character>, NetworkError> {
        let request = makeRequest {
            ApiEndpoint.fetchFilteredCharacters(currentPage, filterParam, filterValue)
        }
        return requestWithEffect(request)
    }

    func fetchSingleCharacter(withId: Int) -> Effect<Character, NetworkError> {
        let request = makeRequest {
            ApiEndpoint.fetchSingleCharacter(withId)
        }
        return requestWithEffect(request)
    }

    func fetchMultipleCharacters(withIds: [Int]) -> Effect<[Character], NetworkError> {
        let request = makeRequest {
            ApiEndpoint.fetchMultipleCharacters(withIds)
        }
        return requestWithEffect(request)
    }

    // MARK: -  Locations methods
    func fetchAllLocations(currentPage: Int) -> Effect<GeneralRequest<Location>, NetworkError> {
        let request = makeRequest {
            ApiEndpoint.fetchAllLocations(currentPage)
        }
        return requestWithEffect(request)
    }

    func fetchFilteredLocations(currentPage: Int, filterParam: [String], filterValue: [String]) -> Effect<GeneralRequest<Location>, NetworkError> {
        let request = makeRequest {
            ApiEndpoint.fetchFilteredLocations(currentPage, filterParam, filterValue)
        }
        return requestWithEffect(request)
    }

    func fetchSingleLocation(withId: Int) -> Effect<Location, NetworkError> {
        let request = makeRequest {
            ApiEndpoint.fetchSingleLocation(withId)
        }
        return requestWithEffect(request)
    }

    func fetchMultipleLocations(withIds: [Int]) -> Effect<[Location], NetworkError> {
        let request = makeRequest {
            ApiEndpoint.fetchMultipleLocations(withIds)
        }
        return requestWithEffect(request)
    }

    // MARK: -  Episodes methods
    func fetchAllEpisodes(currentPage: Int) -> Effect<GeneralRequest<Episode>, NetworkError> {
        let request = makeRequest {
            ApiEndpoint.fetchAllEpisodes(currentPage)
        }
        return requestWithEffect(request)
    }

    func fetchFilteredEpisodes(seasonNumber: Int) -> Effect<GeneralRequest<Episode>, NetworkError> {
        let request = makeRequest {
            ApiEndpoint.fetchFilteredEpisodes(seasonNumber)
        }
        return requestWithEffect(request)
    }

    func fetchSingleEpisode(withId: Int) -> Effect<Episode, NetworkError> {
        let request = makeRequest {
            ApiEndpoint.fetchSingleEpisode(withId)
        }
        return requestWithEffect(request)
    }

    func fetchMultipleEpisodes(withIds: [Int]) -> Effect<[Episode], NetworkError> {
        let request = makeRequest {
            ApiEndpoint.fetchMultipleEpisodes(withIds)
        }
        return requestWithEffect(request)
    }
}
