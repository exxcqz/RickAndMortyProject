//
//  Created by Nikita Gavrikov on 25.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct TabBarItem: Equatable, Identifiable {
    var id: TabID
    var isActive: Bool = false
    var icon: UIImage
    var iconFilled: UIImage
}
