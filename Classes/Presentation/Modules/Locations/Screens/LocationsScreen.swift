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
                    ScrollView {
                        GeometryReader { geo in
                            let offset = geo.frame(in: .global).maxY
                            ZStack {
                                if offset < 95 {
                                    Color(Asset.Colors.blackBG.name)
                                } else {
                                    LocationsNavigationComponent()
                                }
                                LocationsTitleComponent()
                            }
                            .offset(y: self.getOffsetForHeaderImage(geo))
                        }
                        .frame(height: Layout.scaleFactorH * 248)
                        .zIndex(1)
                        VStack(spacing: 0) {
                            ForEach(viewStore.state.locationsData, id: \.id) { card in
                                NavigationLink {
                                    DetailsHelloComponent()
                                } label: {
                                    LocationsCardComponent(
                                        locationName: card.name,
                                        locationType: card.type,
                                        locationIcon: card.icon
                                    )
                                }
                            }
                        }
                        .padding(.bottom, 8)
                        .padding(.top, 8)
                        .zIndex(0)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    viewStore.send(.updateLocationsData)
                }
                .navigationBarHidden(true)
            }
        }
    }

    private func getOffsetForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = geometry.frame(in: .global).minY
        let sizeOffScreen: CGFloat = 154

        if offset < -sizeOffScreen {
            let imageOffset = abs(min(-sizeOffScreen, offset))
            return imageOffset - sizeOffScreen
        }

        if offset > 0 {
            return -offset
        }

        return 0
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
