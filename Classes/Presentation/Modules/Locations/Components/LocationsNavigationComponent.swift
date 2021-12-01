//
//  Created by Nikita Gavrikov on 26.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct LocationsNavigationComponent: View {

    var body: some View {
        ZStack {
            Image(Asset.Pictures.locations.name)
                .resizable()
                .frame(height: Layout.scaleFactorH * 248)
            HStack {
                Text(L10n.Locations.title)
                    .font(Font.appFontBold(ofSize: Layout.scaleFactorW * 28))
                    .padding(.leading, Layout.scaleFactorW * 24)
                    .foregroundColor(.white)
                    .frame(height: 34)
                Spacer()
            }
            .padding(.top, Layout.scaleFactorH * 214)
        }
    }
}

struct LocationsNavigationComponent_Previews: PreviewProvider {
    static var previews: some View {
        LocationsNavigationComponent()
    }
}
