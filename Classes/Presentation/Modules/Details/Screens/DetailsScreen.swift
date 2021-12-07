//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct DetailsScreen: View {
    let store: Store<DetailsState, DetailsAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                switch viewStore.selectedDetails {
                case .character:
                    CharacterDetailsView(store: Store(
                        initialState: DetailsState(),
                        reducer: detailsReducer,
                        environment: DetailsEnvironment()
                    ))
                case .location:
                    DetailsHelloComponent()
                case .episode:
                    DetailsHelloComponent()
                }
            }
        }
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen(
            store: Store(
                initialState: DetailsState(),
                reducer: detailsReducer,
                environment: DetailsEnvironment()
            )
        )
    }
}
