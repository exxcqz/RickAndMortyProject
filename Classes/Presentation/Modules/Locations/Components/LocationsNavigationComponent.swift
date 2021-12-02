//
//  Created by Nikita Gavrikov on 26.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct LocationsNavigationComponent: View {
    var body: some View {
        Image(Asset.Pictures.locations.name)
            .resizable()
            .frame(height: Layout.scaleFactorH * 248)
    }
}

struct LocationsNavigationComponent_Previews: PreviewProvider {
    static var previews: some View {
        LocationsNavigationComponent()
    }
}
