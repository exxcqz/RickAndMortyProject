//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import UIKit

struct SplashState: Equatable {
    var isShown: Bool = true
    var tabBar = TabBarState()
}
