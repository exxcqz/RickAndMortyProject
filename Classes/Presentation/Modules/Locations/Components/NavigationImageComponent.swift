//
//  Created by Nikita Gavrikov on 03.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct NavigationImageComponent: View {
    let image: String

    var body: some View {
        Image(image)
            .resizable()
            .frame(height: Layout.scaleFactorH * 248)
    }
}
