//
//  Created by Alexander Loshakov on 13.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: -  Initializer for HEX-color

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
