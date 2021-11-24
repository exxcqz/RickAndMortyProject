//
//  Created by Alexander Loshakov on 23.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct SplashScreenTitleComponent: View {
    let scaleFactorW: CGFloat
    let scaleFactorH: CGFloat

    var body: some View {
        Image(Asset.SplashImages.splashTitle.name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: scaleFactorW*140, height: scaleFactorH*40)
            .padding(.horizontal, scaleFactorW*118.0)
            .padding(.top, scaleFactorH*164.0)
            .edgesIgnoringSafeArea(.all)
    }
}

struct SplashScreenTitleComponent_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenTitleComponent(scaleFactorW: 1, scaleFactorH: 1)
    }
}
