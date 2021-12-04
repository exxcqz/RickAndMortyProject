//
//  Created by Nikita Gavrikov on 01.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import UIKit

struct LocationsCardItem: Equatable {
    let id: Int
    let name: String
    let type: LocationsType
    let icon: UIImage
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
