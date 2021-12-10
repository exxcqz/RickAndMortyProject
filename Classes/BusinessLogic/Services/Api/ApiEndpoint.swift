//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import Networking

enum ApiEndpoint: Endpoint {
    case fetchCharacters(_ currentPage: Int)
    case fetchEpisodes(_ currentPage: Int)
    case fetchLocations(_ currentPage: Int)
    case fetchSingleCharacter(_ withId: Int)
    case fetchSingleLocation(_ withId: Int)
    case fetchSingleEpisode(_ withId: Int)

    // Endpoint.url = baseURL + path (определяется в фреймворке в расширении для Endpoint)
    // baseURL задается в AppConfiguration (в нашем случае - https://rickandmortyapi.com/)
    var baseURL: URL { return AppConfiguration.serverURL }

    // path - часть пути, указывающая, какой ресурс мы хотим получить
    var path: String {
        switch self {
        case .fetchCharacters:
            return "api/character/"
        case .fetchSingleCharacter(let id):
            return "api/character/\(id)"
        case .fetchLocations:
            return "api/location/"
        case .fetchSingleLocation(let id):
            return "api/location/\(id)"
        case .fetchEpisodes:
            return "api/episode/"
        case .fetchSingleEpisode(let id):
            return "api/episode/\(id)"
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
        case let .fetchLocations(currentPage):
            return ["page": "\(currentPage)"] // какую страницу открыть сейчас?
        case .fetchCharacters(let currentPage):
            return ["page": currentPage] // какую страницу открыть сейчас?
        case .fetchEpisodes(let currentPage):
            return ["page": currentPage] // какую страницу открыть сейчас?
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
