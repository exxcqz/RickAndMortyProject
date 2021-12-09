//
//  Created by Nikita Gavrikov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct DetailsCharacterComponent: View {
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
                        ).padding(.top, 108)

                        DetailsInfoComponent(
                            currentDetails: viewStore.selectedDetails,
                            episode: viewStore.episode,
                            character: viewStore.character,
                            location: viewStore.location
                        ).padding(.top, 24)

                        if viewStore.selectedDetails == .character {
                        HStack {
                            Text("Origin")
                                .font(Font.appFontSemibold(ofSize: 17))
                                .foregroundColor(.white)
                                .frame(height: 22)
                            Spacer()
                        }
                        .padding(.top, 24)
                        .padding(.leading, 24)
                        LocationsCardComponent(locationDetail: viewStore.location)
                            .padding(.top, 16)
                        }

//                        HStack {
//                            Text("Episodes")
//                                .font(Font.appFontSemibold(ofSize: 17))
//                                .foregroundColor(.white)
//                                .frame(height: 22)
//                            Spacer()
//                        }
//                        .padding(.top, 24)
//                        .padding(.leading, 24)
//                        VStack(spacing: 16) {
//                            ForEach(viewStore.episodes, id: \.id) { episode in
//                                EpisodeCard(episode: episode)
//                                    .padding(.horizontal, 24)
//                            }
//                        }
                        
                        DetailsScrollComponent(
                            store: Store(
                                initialState: DetailsState(selectedDetails: .location),
                                reducer: detailsReducer,
                                environment: DetailsEnvironment()
                            ),
                            currentDetails: viewStore.selectedDetails
                        )
                        .padding(.top, 16)
                        .padding(.bottom, 16)
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

// MARK: -  Check for empty value

extension String {

    var checkEmpty: String {
        if self.isEmpty {
            return "None"
        }
        return self
    }
}
