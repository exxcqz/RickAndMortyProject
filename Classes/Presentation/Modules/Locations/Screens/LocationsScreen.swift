//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct LocationsScreen: View {
    let store: Store<LocationsState, LocationsAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                ZStack {
                    Color(Asset.Colors.blackBG.name)
                    VStack {
                        LocationsNavigationComponent()
                        ScrollView {
                            VStack(spacing: 0) {
                                ForEach(viewStore.state.locationsData, id: \.id) { card in
                                    NavigationLink {
                                        DetailsHelloComponent()
                                    } label: {
                                        LocationsCardComponent(locationName: card.name, locationType: card.type)
                                    }
                                }
                            }
                            .padding(.bottom, 8)
                            .padding(.top, 8)
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    viewStore.send(.updateLocationsData)
                }
            }
        }
    }
}

struct LocationsScreen_Previews: PreviewProvider {
    static var previews: some View {
        LocationsScreen(
            store: Store(
                initialState: LocationsState(),
                reducer: locationsReducer,
                environment: LocationsEnvironment()
            )
        )
    }
}
