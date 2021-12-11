//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Combine
import ComposableArchitecture
import Networking

final class CharactersService: CharactersServiceProtocol {
    func fetchAllCharacters(currentPage: Int) -> Effect<GeneralRequest<Character>, NetworkError> {
        let request = makeRequest {
            CharactersEndpoint.fetchAllCharacters(currentPage)
        }
        return requestWithEffect(request)
    }

    func fetchFilteredCharacters(currentPage: Int, filterParam: [String], filterValue: [String]) -> Effect<GeneralRequest<Character>, NetworkError> {
        let request = makeRequest {
            CharactersEndpoint.fetchFilteredCharacters(currentPage, filterParam, filterValue)
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
