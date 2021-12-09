//
//  Created by Александр Васильевич on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Combine
import ComposableArchitecture
import Networking

final class ApiService: ApiServiceProtocol {
    func fetchCharacters(currentPage: Int) -> Effect<GeneralRequest<Character>, NetworkError> {
        let request = makeRequest {
            ApiEndpoint.fetchLocations(currentPage)
        }
        return requestWithEffect(request)
    }

    func fetchLocations(currentPage: Int) -> Effect<GeneralRequest<Location>, NetworkError> {
        let request = makeRequest {
            ApiEndpoint.fetchLocations(currentPage)
        }
        return requestWithEffect(request)
    }

    func fetchEpisodes(currentPage: Int) -> Effect<GeneralRequest<Episode>, NetworkError> {
        let request = makeRequest {
            ApiEndpoint.fetchLocations(currentPage)
        }
        return requestWithEffect(request)
    }
}
