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

    // Endpoint.url = baseURL + path (определяется в фреймворке в расширении для Endpoint)
    // baseURL задается в AppConfiguration (в нашем случае - https://rickandmortyapi.com/)
    var baseURL: URL { return AppConfiguration.serverURL }

    // path - часть пути, указывающая, какой ресурс мы хотим получить
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

    // какой HTTPMethod используем (в нашем случае только GET-запросы, потому что мы ничего не обновляем, только получаем)
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }

    // headers (заголовки) - Content-Type, Медиатипы, "расширение файлов"
    // Когда мы передаем данные, мы должны сообщить или запросить, какой тип хотим получить в ответ.
    var headers: [RequestHeader] {
        return [RequestHeaders.contentType("application/json")]
    }

    // параметры для запроса (в нашем случае - какую страницу подгрузить)
    var parameters: Parameters? {
        switch self {
        case let .fetchAllLocations(currentPage):
            return ["page": "\(currentPage)"] // какую страницу открыть сейчас?
        case let .fetchFilteredLocations(currentPage, filterParam, filterValue):
            var resultDict = ["page": "\(currentPage)"]
            filterParam.enumerated().forEach { (index, value) in
                resultDict[value] = filterValue[index]
            }
            return resultDict

        case .fetchAllCharacters(let currentPage):
            return ["page": "\(currentPage)"] // какую страницу открыть сейчас?
        case let .fetchFilteredCharacters(currentPage, filterParam, filterValue):
            var resultDict = ["page": "\(currentPage)"]
            filterParam.enumerated().forEach { (index, value) in
                resultDict[value] = filterValue[index]
            }
            return resultDict

        case .fetchAllEpisodes(let currentPage):
            return ["page": "\(currentPage)"] // какую страницу открыть сейчас?
        case let .fetchFilteredEpisodes(seasonNumber):
            return ["episode": "S0\(seasonNumber)"]
        default:
            return nil
        }
    }

    // для get запросов - URLEncoding, для остальных - JSONEncoding
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }

    // тип авторизации (api-ключ), в нашем случае без ключа, поэтому .none
    var authorizationType: AuthorizationType {
        .none
    }
}
