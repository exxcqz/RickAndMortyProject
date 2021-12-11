//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import Networking

enum ApiEndpoint: Endpoint {
    case fetchAllCharacters(_ currentPage: Int)
    case fetchFilteredCharacters(_ currentPage: Int, _ filterParam: [String], _ filterValue: [String])
    case fetchSingleCharacter(_ withId: Int)
    case fetchMultipleCharacters(_ withIds: [Int])

    case fetchAllLocations(_ currentPage: Int)
    case fetchFilteredLocations(_ currentPage: Int, _ filterParam: [String], _ filterValue: [String])
    case fetchSingleLocation(_ withId: Int)
    case fetchMultipleLocations(_ withIds: [Int])

    case fetchAllEpisodes(_ currentPage: Int)
    case fetchFilteredEpisodes(_ seasonNumber: Int)
    case fetchSingleEpisode(_ withId: Int)
    case fetchMultipleEpisodes(_ withIds: [Int])

    var baseURL: URL { return AppConfiguration.serverURL }

    var path: String {
        switch self {
        case .fetchAllCharacters:
            return "api/character/"
        case .fetchFilteredCharacters:
            return "api/character/"
        case .fetchSingleCharacter(let id):
            return "api/character/\(id)"
        case .fetchMultipleCharacters(let ids):
            return "api/character/\(ids)"

        case .fetchAllLocations:
            return "api/location/"
        case .fetchFilteredLocations:
            return "api/location/"
        case .fetchSingleLocation(let id):
            return "api/location/\(id)"
        case .fetchMultipleLocations(let ids):
            return "api/character/\(ids)"

        case .fetchAllEpisodes:
            return "api/episode/"
        case .fetchFilteredEpisodes:
            return "api/episode/"
        case .fetchSingleEpisode(let id):
            return "api/episode/\(id)"
        case .fetchMultipleEpisodes(let ids):
            return "api/character/\(ids)"
        }
    }

    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
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

        case .fetchAllCharacters(let currentPage):
            return ["page": "\(currentPage)"]
        case let .fetchFilteredCharacters(currentPage, filterParam, filterValue):
            return convertFilterParams(currentPage, filterParam, filterValue)

        case .fetchAllEpisodes(let currentPage):
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
