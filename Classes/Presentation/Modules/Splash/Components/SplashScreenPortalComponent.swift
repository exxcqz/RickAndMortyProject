//
//  Created by Александр Васильевич on 23.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct SplashScreenPortalComponent: View {
    let scaleFactorW: CGFloat
    let scaleFactorH: CGFloat

    var body: some View {
        Image(Asset.SplashImages.splashPortal.name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: scaleFactorW*140, height: scaleFactorH*228)
            .padding(.horizontal, scaleFactorW*118.0)
            .padding(.bottom, scaleFactorH*344.0)
            .edgesIgnoringSafeArea(.all)
    }
}

struct SplashScreenPortalComponent_Previews: PreviewProvider {
    static var previews: some View {
        CharactersHelloComponent()
    }
}
