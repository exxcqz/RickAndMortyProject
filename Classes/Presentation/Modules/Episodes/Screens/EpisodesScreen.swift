//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct EpisodesScreen: View {
    let store: Store<EpisodesState, EpisodesAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                EpisodesHelloComponent()
            }
        }
    }
}

struct EpisodesScreen_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesScreen(
            store: Store(
                initialState: EpisodesState(),
                reducer: episodesReducer,
                environment: EpisodesEnvironment()
            )
        )
    }
}
