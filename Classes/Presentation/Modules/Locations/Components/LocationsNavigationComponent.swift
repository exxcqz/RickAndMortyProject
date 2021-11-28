//
//  Created by Nikita Gavrikov on 26.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct LocationsNavigationComponent: View {
    let scaleFactorW: CGFloat = UIScreen.main.bounds.size.width / 375
    let scaleFactorH: CGFloat = UIScreen.main.bounds.size.height / 812

    var body: some View {
        ZStack {
            Image(Asset.Pictures.locations.name)
                .resizable()
                .frame(height: scaleFactorH * 248.0)
            HStack {
                Text(L10n.Locations.title)
                    .font(Font.appFontBold(ofSize: 28))
                    .padding(.leading, scaleFactorW * 24.0)
                    .foregroundColor(.white)
                    .frame(height: scaleFactorH * 34.0)
                Spacer()
            }
            .padding(.top, scaleFactorH * 214.0)
        }
    }
}

struct LocationsNavigationComponent_Previews: PreviewProvider {
    static var previews: some View {
        LocationsNavigationComponent()
    }
}
