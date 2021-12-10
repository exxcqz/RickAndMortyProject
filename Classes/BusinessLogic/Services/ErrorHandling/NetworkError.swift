//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation

/// Lists possible errors when making requests to the server
enum NetworkError: Equatable, Error {
    var string: String { return String(reflecting: self) }

    static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        guard type(of: lhs) == type(of: rhs) else { return false } // проверка на равенство типов ошибок
        return lhs.string == rhs.string // проверка на равенство сообщений ошибок
    }

    case unexpected(_ error: Error)
    case decoding(_ error: Error)
    case network(_ error: Error)
    case statusCode(_ statusCode: Int)
    case nonHTTPResponse

    /// Convert Error to NetworkError
    static func map(_ error: Error) -> NetworkError {
        switch error {
        case let decodingError as DecodingError:
            return NetworkError.decoding(decodingError)

        default: return (error as? NetworkError) ?? .unexpected(error)
        }
    }
}
