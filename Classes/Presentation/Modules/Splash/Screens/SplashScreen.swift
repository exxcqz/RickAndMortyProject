//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct SplashScreen: View {
    let store: Store<SplashState, SplashAction>
    let scaleFactorW: CGFloat = UIScreen.main.bounds.size.width / 375
    let scaleFactorH: CGFloat = UIScreen.main.bounds.size.height / 812

    var body: some View {
        WithViewStore(store) { viewStore in
                ZStack {
                    Color(Asset.Colors.blackBG.color)
                        .edgesIgnoringSafeArea(.all)
                    SplashScreenStarsComponent(scaleFactorW: scaleFactorW, scaleFactorH: scaleFactorH)
                    VStack {
                        SplashScreenTitleComponent(scaleFactorW: scaleFactorW, scaleFactorH: scaleFactorH)
                        Spacer()
                            .frame(height: scaleFactorH*36)
                        SplashScreenPortalComponent(scaleFactorW: scaleFactorW, scaleFactorH: scaleFactorH)
                        Spacer()
                    }
                    // AnimationViewComponent(name: "portal", loopMode: .loop)
                }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen(
            store: Store(
                initialState: SplashState(),
                reducer: splashReducer,
                environment: SplashEnvironment()
            )
        )
    }
}
