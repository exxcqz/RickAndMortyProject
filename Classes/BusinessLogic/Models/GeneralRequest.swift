//
//  Created by Alexander Loshakov on 05.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation

struct GeneralRequest<T: Decodable>: Decodable {
    let info: RequestInfo
    let results: [T]
}

struct RequestInfo: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
