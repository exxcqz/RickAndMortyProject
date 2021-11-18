//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct CharactersScreen: View {
    let store: Store<CharactersState, CharactersAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                CharactersHelloComponent()
            }
        }
    }
}

struct CharactersScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharactersScreen(
            store: Store(
                initialState: CharactersState(),
                reducer: charactersReducer,
                environment: CharactersEnvironment()
            )
        )
    }
}
