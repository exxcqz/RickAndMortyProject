//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import Networking

enum CharactersEndpoint: Endpoint {
    case fetchAllCharacters(_ currentPage: Int)
    case fetchFilteredCharacters(_ currentPage: Int, _ filterParam: [String], _ filterValue: [String])
    case fetchMultipleCharacters(_ withIds: [Int])

    var baseURL: URL {
        return AppConfiguration.serverURL
    }

    var path: String {
        switch self {
        case .fetchAllCharacters:
            return "api/character/"
        case .fetchFilteredCharacters:
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
        case let .fetchAllCharacters(currentPage):
            return ["page": "\(currentPage)"]
        case let .fetchFilteredCharacters(currentPage, filterParam, filterValue):
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
