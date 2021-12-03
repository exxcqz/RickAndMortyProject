//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct LocationsScreen: View {
    let store: Store<LocationsState, LocationsAction>

    var body: some View {
        //        NavigationView {
        WithViewStore(store) { viewStore in
            ZStack {
                Color(Asset.Colors.blackBG.name)
                ScrollView(.vertical, showsIndicators: false) {
                    StickyHeaderComponent(
                        navigationImage: viewStore.state.navigationImage,
                        navigationTitle: viewStore.state.navigationTitle
                    )
                    VStack(spacing: 0) {
                        ForEach(viewStore.state.locationsData, id: \.id) { card in
                            NavigationLink {
                                DetailsHelloComponent()
                            } label: {
                                LocationsCardComponent(
                                    locationName: card.name,
                                    locationType: card.type.rawValue,
                                    locationIcon: card.icon
                                )
                            }
                        }
                    }
                    .padding(.bottom, 8)
                    .zIndex(0)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                viewStore.send(.updateLocationsData)
            }
        }
        //            .navigationBarHidden(true)
        //        }
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
