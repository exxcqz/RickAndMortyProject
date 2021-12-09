//
//  Created by Александр Васильевич on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation

import Combine
import ComposableArchitecture
import Foundation
import Networking

func makeRequest(_ endpoint: @escaping () -> Endpoint) -> URLRequest {

    var request = URLRequest(url: endpoint().url) // Endpoint.url = baseURL + path (определяется в фреймворке в расширении для Endpoint)
    request.method = endpoint().method // // какой HTTPMethod используем
    request.headers = endpoint().headers.httpHeaders
    //    request.httpBody = requestBodyFrom(params: endpoint().parameters)
    print("request: \(request)")

    var components = URLComponents(url: endpoint().url, resolvingAgainstBaseURL: true)
    let queryItems = endpoint().parameters!.map { parameter in
        URLQueryItem(name: parameter.key, value: parameter.value as? String)
    }
    components!.queryItems = queryItems
    var testRequest = URLRequest(url: components!.url!)
    testRequest.method = endpoint().method
    testRequest.headers = endpoint().headers.httpHeaders
    print("testRequest: \(testRequest)") // https://rickandmortyapi.com/api/location?page=2

    return testRequest
}

// TODO: Refactor - ignoring result
func requestWithEffectIgnoringResult(_ request: URLRequest) -> Effect<Nothing, NetworkError> {
    URLSession.shared.dataTaskPublisher(for: request)
        .mapError { .network($0) }
        .map { _ in Nothing() }
        .eraseToAnyPublisher()
        .eraseToEffect()
}

/// Allows you to make a request and handle errors such as:
/// - errors from the server
/// - client errors (decoding or others)
///
/// For more information about error types, see NetworkError and the NetworkError.map() method,
/// which converts Error to NetworkError
func requestWithEffect<T: Codable>(_ request: URLRequest) -> Effect<T, NetworkError> {
    URLSession.shared.dataTaskPublisher(for: request)
        .tryMap { response in
            /// Check that the response is an HTTP response
            guard
                let httpResponse = response.response as? HTTPURLResponse
            else {
                throw NetworkError.nonHTTPResponse
            }

            let statusCode = httpResponse.statusCode

            /// Check that the response from the server has returned with a successful status
            guard
                (200 ..< 300).contains(statusCode)
            else {
                throw NetworkError.statusCode(statusCode)
            }

            /// Try deserializing data into a model
            return try JSONDecoder().decode(T.self, from: response.data)
        }
        // Convert Error to NetworkError
        .mapError { NetworkError.map($0) }
        .eraseToAnyPublisher()
        .eraseToEffect()
}

func requestBodyFrom(params: [String: Any]?) -> Data? {
    guard let params = params else {
        return nil
    }

    guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {
        return nil
    }

    return httpBody
}
