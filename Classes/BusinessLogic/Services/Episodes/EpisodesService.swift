//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Combine
import ComposableArchitecture
import Networking

final class EpisodesService: EpisodesServiceProtocol {
    func fetchAllEpisodes(currentPage: Int) -> Effect<GeneralRequest<Episode>, NetworkError> {
        let request = makeRequest {
            EpisodesEndpoint.fetchAllEpisodes(currentPage)
        }
        return requestWithEffect(request)
    }

    func fetchFilteredEpisodes(seasonNumber: Int) -> Effect<GeneralRequest<Episode>, NetworkError> {
        let request = makeRequest {
            EpisodesEndpoint.fetchFilteredEpisodes(seasonNumber)
        }
        return requestWithEffect(request)
    }

    func fetchMultipleEpisodes(withIds: [Int]) -> Effect<[Episode], NetworkError> {
        let request = makeRequest {
            EpisodesEndpoint.fetchMultipleEpisodes(withIds)
        }
        return requestWithEffect(request)
    }
}
