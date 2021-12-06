//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct LocationsScreen: View {
    let store: Store<LocationsState, LocationsAction>

    var body: some View {
        NavigationView {
            WithViewStore(store) { viewStore in
                ZStack {
                    Color(Asset.Colors.blackBG.name)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            StickyHeaderComponent(
                                navigationImage: viewStore.state.navigationImage,
                                navigationTitle: viewStore.state.navigationTitle,
                                isFilterHidden: true,
                                searchRequest: viewStore.binding(
                                    get: {
                                        $0.searchRequest
                                    }, send: {
                                        LocationsAction.searchInputChanged($0)
                                    }
                                )
                            )
                            VStack(spacing: 16) {
                                ForEach(viewStore.state.locationsData, id: \.id) { card in
                                    NavigationLink {
                                        DetailsHelloComponent()
                                    } label: {
                                        LocationsCardComponent(locationDetail: card)
                                    }
                                }
                            }
                            .padding(.vertical, Layout.scaleFactorH * 16)
                            .zIndex(0)
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    viewStore.send(.updateLocationsData)
                }
            }
            .navigationBarHidden(true)
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
