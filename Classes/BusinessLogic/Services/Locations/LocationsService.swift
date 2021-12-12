//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Combine
import ComposableArchitecture
import Networking

final class LocationsService: LocationsServiceProtocol {
    func fetchLocations(withParameters: FetchingParameters) -> Effect<GeneralRequest<Location>, NetworkError> {
        let request = makeRequest {
            LocationsEndpoint.fetchLocations(withParameters)
        }
        return requestWithEffect(request)
    }

    func fetchMultipleLocations(withIds: [Int]) -> Effect<[Location], NetworkError> {
        let request = makeRequest {
            LocationsEndpoint.fetchMultipleLocations(withIds)
        }
        return requestWithEffect(request)
    }
}
