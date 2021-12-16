//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import Networking

enum EpisodesEndpoint: Endpoint {
    case fetchEpisodes(FetchingParameters)
    case fetchMultipleEpisodes([Int])

    var baseURL: URL {
        return AppConfiguration.serverURL
    }

    var path: String {
        switch self {
        case .fetchEpisodes:
            return "api/episode/"
        case let .fetchMultipleEpisodes(ids):
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
        case let .fetchEpisodes(parameters):
            return parameters.convertToDict()
        default:
            return nil
        }
    }
}

extension EpisodesEndpoint {
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }

    var authorizationType: AuthorizationType {
        .none
    }
}
