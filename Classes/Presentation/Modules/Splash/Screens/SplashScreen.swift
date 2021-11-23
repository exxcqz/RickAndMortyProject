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
            VStack {
                SplashScreenComponent()
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
