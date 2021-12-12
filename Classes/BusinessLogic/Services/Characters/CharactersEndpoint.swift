//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import Networking

enum CharactersEndpoint: Endpoint {
    case fetchCharacters(_ withParameters: FetchingParameters)
    case fetchMultipleCharacters(_ withIds: [Int])

    var baseURL: URL {
        return AppConfiguration.serverURL
    }

    var path: String {
        switch self {
        case .fetchCharacters:
            return "api/character/"
        case .fetchMultipleCharacters(let ids):
            return "api/character/\(ids)"
        }
    }

    var method: HTTPMethod {
        return .get
    }

    var headers: [RequestHeader] {
        return [RequestHeaders.contentType("application/json")]
    }

    var parameters: Parameters? {
        switch self {
        case let .fetchCharacters(parameters):
            return parameters.convertToDict()
        default:
            return nil
        }
    }

    var parameterEncoding: ParameterEncoding {
        return URLEncoding.queryString
    }

    var authorizationType: AuthorizationType {
        .none
    }
}
