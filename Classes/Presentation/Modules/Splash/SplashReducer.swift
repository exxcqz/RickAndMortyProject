//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let splashReducer = Reducer<SplashState, SplashAction, SplashEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            // открыть tabbar-модуль через какое-то время
        }
    }
    return .none
}
