//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Combine
import ComposableArchitecture
import Networking

final class EpisodesService: EpisodesServiceProtocol {
    func fetchEpisodes(withParameters: FetchingParameters) -> Effect<GeneralRequest<Episode>, NetworkError> {
        let request = makeRequest {
            EpisodesEndpoint.fetchEpisodes(withParameters)
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
