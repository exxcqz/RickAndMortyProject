//
//  Created by Alexander Loshakov on 23.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct SplashScreenStarsComponent: View {
    let scaleFactorW: CGFloat
    let scaleFactorH: CGFloat

    var body: some View {
        Image(Asset.SplashImages.splashStars.name)
            .resizable(resizingMode: .stretch)
            .padding(.leading, scaleFactorW*16.0)
            .padding(.trailing, scaleFactorW*25.0)
            .padding(.top, scaleFactorH*98.0)
            .padding(.bottom, scaleFactorH*64.0)
            .edgesIgnoringSafeArea(.all)
    }
}

struct SplashScreenStarsComponent_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenStarsComponent(scaleFactorW: 1, scaleFactorH: 1)
    }
}
