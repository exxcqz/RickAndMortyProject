//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import Networking

enum LocationsEndpoint: Endpoint {
    case fetchAllLocations(_ currentPage: Int)
    case fetchFilteredLocations(_ currentPage: Int, _ filterParam: [String], _ filterValue: [String])
    case fetchMultipleLocations(_ withIds: [Int])

    var baseURL: URL {
        return AppConfiguration.serverURL
    }

    var path: String {
        switch self {
        case .fetchAllLocations:
            return "api/location/"
        case .fetchFilteredLocations:
            return "api/location/"
        case .fetchMultipleLocations(let ids):
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
        case let .fetchAllLocations(currentPage):
            return ["page": "\(currentPage)"]
        case let .fetchFilteredLocations(currentPage, filterParam, filterValue):
            return convertFilterParams(currentPage, filterParam, filterValue)
        default:
            return nil
        }
    }

    func convertFilterParams(_ currentPage: Int, _ filterParam: [String], _ filterValue: [String]) -> [String: Any] {
        var resultDict = ["page": "\(currentPage)"]
        filterParam.enumerated().forEach { (index, value) in
            resultDict[value] = filterValue[index]
        }
        return resultDict
    }

    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }

    var authorizationType: AuthorizationType {
        .none
    }
}
