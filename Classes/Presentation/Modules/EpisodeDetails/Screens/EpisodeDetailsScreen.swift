//
//  Created by Nikita Gavrikov on 12/12/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct EpisodeDetailsScreen: View {
    let store: Store<EpisodeDetailsState, EpisodeDetailsAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                EpisodeDetailsHelloComponent()
            }
        }
    }
}

struct EpisodeDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailsScreen(
            store: Store(
                initialState: EpisodeDetailsState(),
                reducer: episodeDetailsReducer,
                environment: EpisodeDetailsEnvironment()
            )
        )
    }
}
