//
//  Created by Nikita Gavrikov on 12/12/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct LocationDetailsScreen: View {
    let store: Store<LocationDetailsState, LocationDetailsAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                LocationDetailsHelloComponent()
            }
        }
    }
}

struct LocationDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailsScreen(
            store: Store(
                initialState: LocationDetailsState(),
                reducer: locationDetailsReducer,
                environment: LocationDetailsEnvironment()
            )
        )
    }
}
