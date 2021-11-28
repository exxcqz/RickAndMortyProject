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
                .frame(height: 248.0)
            HStack {
                Text(L10n.Locations.title)
                    .font(Font.appFontBold(ofSize: 28))
                    .padding(.leading, 24.0)
                    .foregroundColor(.white)
                    .frame(height: 34.0)
                Spacer()
            }
            .padding(.top, 214.0)
        }
    }
}

struct LocationsNavigationComponent_Previews: PreviewProvider {
    static var previews: some View {
        LocationsNavigationComponent()
    }
}
