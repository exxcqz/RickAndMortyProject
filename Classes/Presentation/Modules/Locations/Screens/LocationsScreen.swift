//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct LocationsScreen: View {
    let store: Store<LocationsState, LocationsAction>
    let massive = [
        LocationsCardItem(id: 1, nameLocation: "Earth", typeLocation: "Portal", icon: Asset.Icons.icBarLocations.image),
        LocationsCardItem(id: 2, nameLocation: "Abadango", typeLocation: "Cluster", icon: Asset.Icons.icCluster.image),
        LocationsCardItem(id: 3, nameLocation: "Citadel", typeLocation: "Microversa", icon: Asset.Icons.icMicroverse.image),
        LocationsCardItem(id: 4, nameLocation: "Earth", typeLocation: "Portal", icon: Asset.Icons.icBarLocations.image),
        LocationsCardItem(id: 5, nameLocation: "Abadango", typeLocation: "Cluster", icon: Asset.Icons.icCluster.image)
    ]

    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                ZStack {
                    Color(Asset.Colors.blackBG.name)
                    VStack {
                        LocationsNavigationComponent()
                        ScrollView {
                            ForEach(massive, id: \.self) { card in
                                NavigationLink {
                                    DetailsHelloComponent()
                                } label: {
                                    LocationsCardComponent(card: card)
                                }
                            }
                            .padding(.bottom, 8)
                        }
                        .padding(.top, 8)
                    }
                }
                .edgesIgnoringSafeArea(.all)
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
