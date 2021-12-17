//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Combine
import ComposableArchitecture
import Networking

final class CharactersService: CharactersServiceProtocol {
    func fetchCharacters(withParameters: FetchingParameters) -> Effect<GeneralRequest<Character>, NetworkError> {
        let request = makeRequest {
            CharactersEndpoint.fetchCharacters(withParameters)
        }
        return requestWithEffect(request)
    }

    func fetchMultipleCharacters(withIds: [Int]) -> Effect<[Character], NetworkError> {
        let request = makeRequest {
            CharactersEndpoint.fetchMultipleCharacters(withIds)
        }
        return requestWithEffect(request)
    }
}
