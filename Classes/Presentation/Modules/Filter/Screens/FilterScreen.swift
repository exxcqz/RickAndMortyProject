//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct FilterScreen: View {
    let store: Store<FilterState, FilterAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                FilterHelloComponent()
            }
        }
    }
}

struct FilterScreen_Previews: PreviewProvider {
    static var previews: some View {
        FilterScreen(
            store: Store(
                initialState: FilterState(),
                reducer: filterReducer,
                environment: FilterEnvironment()
            )
        )
    }
}
