//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct LocationsScreen: View {
    let store: Store<LocationsState, LocationsAction>
    let massive = [
        LocationsCardModel(id: 1, name: "Testicle Monster Dimension", type: "Cluster", dimension: nil, residents: nil, url: nil, created: nil),
        LocationsCardModel(id: 2, name: "Earth (C-137)", type: "Planet", dimension: nil, residents: nil, url: nil, created: nil),
        LocationsCardModel(id: 3, name: "Citadel of Ricks", type: "Space station", dimension: nil, residents: nil, url: nil, created: nil),
        LocationsCardModel(id: 4, name: "Worldender's lair", type: "Planet", dimension: nil, residents: nil, url: nil, created: nil),
        LocationsCardModel(id: 5, name: "Interdimensional Cable", type: "TV", dimension: nil, residents: nil, url: nil, created: nil),
        LocationsCardModel(id: 6, name: "Immortality Field Resort", type: "Resort", dimension: nil, residents: nil, url: nil, created: nil),
        LocationsCardModel(id: 7, name: "Purge Planet", type: "Planet", dimension: nil, residents: nil, url: nil, created: nil),
        LocationsCardModel(id: 8, name: "Giant's Town", type: "Fantasy town", dimension: nil, residents: nil, url: nil, created: nil),
    ]

    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                ZStack {
                    Color(Asset.Colors.blackBG.name)
                    VStack {
                        LocationsNavigationComponent()
                        ScrollView {
                            ForEach(massive, id: \.id) { card in
                                NavigationLink {
                                    DetailsHelloComponent()
                                } label: {
                                    LocationsCardComponent(locationName: card.name!, locationType: card.type!)
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
