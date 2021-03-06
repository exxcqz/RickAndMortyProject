//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import Networking

enum LocationsEndpoint: Endpoint {
    case fetchLocations(FetchingParameters)
    case fetchMultipleLocations([Int])

    var baseURL: URL {
        return AppConfiguration.serverURL
    }

    var path: String {
        switch self {
        case .fetchLocations:
            return "api/location/"
        case let .fetchMultipleLocations(ids):
            return "api/location/\(ids)"
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
        case let .fetchLocations(parameters):
            return parameters.convertToDict()
        default:
            return nil
        }
    }
}

extension LocationsEndpoint {
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }

    var authorizationType: AuthorizationType {
        .none
    }
}
