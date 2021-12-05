//
//  Created by Александр Васильевич on 05.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation

struct GeneralRequest<ModelType: Decodable>: Decodable {
    let info: RequestInfo
    let results: [ModelType]
}

struct RequestInfo: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
