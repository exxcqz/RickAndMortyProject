//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import Networking

enum EpisodesEndpoint: Endpoint {
    case fetchAllEpisodes(_ currentPage: Int)
    case fetchFilteredEpisodes(_ seasonNumber: Int)
    case fetchMultipleEpisodes(_ withIds: [Int])

    var baseURL: URL {
        return AppConfiguration.serverURL
    }

    var path: String {
        switch self {
        case .fetchAllEpisodes:
            return "api/episode/"
        case .fetchFilteredEpisodes:
            return "api/episode/"
        case .fetchMultipleEpisodes(let ids):
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
        case let .fetchAllEpisodes(currentPage):
            return ["page": "\(currentPage)"]
        case let .fetchFilteredEpisodes(seasonNumber):
            return ["episode": "S0\(seasonNumber)"]
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
