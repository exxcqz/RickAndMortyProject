//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import UIKit

struct LocationsState: Equatable {
    let navigationImage: String = Asset.Illustrations.locations.name
    let navigationTitle: String = L10n.Locations.title
    var locationsData: [Location] = []
}
