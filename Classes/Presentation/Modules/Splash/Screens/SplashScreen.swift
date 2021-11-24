//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct SplashScreen: View {
    let store: Store<SplashState, SplashAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                Color(Asset.Colors.blackBG.color)
                    .edgesIgnoringSafeArea(.all)
                Image(Asset.SplashImages.splashStars.name)
                    .resizable(resizingMode: .stretch)
                    .padding(.leading, viewStore.scaleFactorW * 16.0)
                    .padding(.trailing, viewStore.scaleFactorW * 25.0)
                    .padding(.top, viewStore.scaleFactorH * 98.0)
                    .padding(.bottom, viewStore.scaleFactorH * 64.0)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image(Asset.SplashImages.splashTitle.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: viewStore.scaleFactorW * 140, height: viewStore.scaleFactorH * 40)
                        .padding(.horizontal, viewStore.scaleFactorW * 118.0)
                        .padding(.top, viewStore.scaleFactorH * 164.0)
                        .edgesIgnoringSafeArea(.all)
                    Spacer()
                        .frame(height: viewStore.scaleFactorH * 36)
                    Image(Asset.SplashImages.splashPortal.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: viewStore.scaleFactorW * 140, height: viewStore.scaleFactorH * 228)
                        .padding(.horizontal, viewStore.scaleFactorW * 118.0)
                        .edgesIgnoringSafeArea(.all)
                    Spacer()
                        .frame(height: viewStore.scaleFactorH * 133)
                    AnimationViewComponent()
                        .frame(width: viewStore.scaleFactorW * 72, height: viewStore.scaleFactorH * 72)
                        .padding(.bottom, viewStore.scaleFactorH * 180)
                }
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
