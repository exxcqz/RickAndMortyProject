//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

let splashReducer: Reducer<SplashState, SplashAction, SplashEnvironment> = .combine(
    .init { state, action, _ in
        switch action {
        case .onAppear:
            state.isShown.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                withAnimation(Animation.easeOut(duration: 0.45)) {
                    // открыть tabbar-модуль через какое-то время
                }
            }
        case .tabBar(let action):
            break
        }
        return .none
    },
    tabBarReducer.pullback(state: \.tabBar, action: /SplashAction.tabBar) { _ in
        TabBarEnvironment()
    }
)
