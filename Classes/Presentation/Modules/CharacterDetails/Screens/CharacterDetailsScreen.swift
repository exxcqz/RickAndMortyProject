//
//  Created by Nikita Gavrikov on 12/12/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct CharacterDetailsScreen: View {
    let store: Store<CharacterDetailsState, CharacterDetailsAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                CharacterDetailsHelloComponent()
            }
        }
    }
}

struct CharacterDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsScreen(
            store: Store(
                initialState: CharacterDetailsState(),
                reducer: characterDetailsReducer,
                environment: CharacterDetailsEnvironment()
            )
        )
    }
}
