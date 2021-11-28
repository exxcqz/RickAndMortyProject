//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import UIKit

struct SplashState: Equatable {
    let scaleFactorW: CGFloat = UIScreen.main.bounds.size.width / 375
    let scaleFactorH: CGFloat = UIScreen.main.bounds.size.height / 812
}
