//
//  Created by Nikita Gavrikov on 26.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct LocationsCardItem: Hashable, Identifiable {
    var id: Int
    var nameLocation: String
    var typeLocation: String
    var icon: UIImage
}
