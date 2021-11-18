//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct DeatilsScreen: View {
    let store: Store<DeatilsState, DeatilsAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                DeatilsHelloComponent()
            }
        }
    }
}

struct DeatilsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DeatilsScreen(
            store: Store(
                initialState: DeatilsState(),
                reducer: deatilsReducer,
                environment: DeatilsEnvironment()
            )
        )
    }
}
