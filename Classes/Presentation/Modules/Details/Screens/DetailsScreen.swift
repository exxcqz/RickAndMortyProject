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
            ZStack {
                Color(Asset.Colors.blackBG.name)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 0) {
                        DetailsHeaderComponent(
                            currentDetails: viewStore.selectedDetails,
                            episode: viewStore.episode,
                            character: viewStore.character,
                            location: viewStore.location
                        ).padding(.top, Layout.scaleFactorH * 108)
                        DetailsInfoComponent(
                            currentDetails: viewStore.selectedDetails,
                            episode: viewStore.episode,
                            character: viewStore.character,
                            location: viewStore.location
                        ).padding(.top, 24)
                        DetailsOriginComponents(
                            currentDetails: viewStore.selectedDetails,
                            location: viewStore.location
                        )
                        DetailsScrollComponent(
                            store: Store(
                                initialState: DetailsState(),
                                reducer: detailsReducer,
                                environment: DetailsEnvironment()
                            ),
                            currentDetails: viewStore.selectedDetails,
                            characters: viewStore.characters,
                            episodes: viewStore.episodes
                        )
                    }
                }
            }
            .navigationBarHidden(true)
            .overlay(
                DetailsNavigationBarComponent()
            )
            .edgesIgnoringSafeArea(.all)
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
