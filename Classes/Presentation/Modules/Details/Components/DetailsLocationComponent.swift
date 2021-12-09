//
//  Created by Nikita Gavrikov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct DetailsLocationComponent: View {
    let store: Store<DetailsState, DetailsAction>
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

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

                        //                        HStack {
                        //                            Text("Residents")
                        //                                .font(Font.appFontSemibold(ofSize: 17))
                        //                                .foregroundColor(.white)
                        //                                .frame(height: 22)
                        //                            Spacer()
                        //                        }
                        //                        .padding(.top, 24)
                        //                        .padding(.leading, 24)
                        //
                        //                        LazyVGrid(columns: columns, spacing: 16) {
                        //                            ForEach(0...8, id: \.self) { character in
                        //                                NavigationLink {
                        //                                    DetailsCharacterComponent(store: Store(
                        //                                        initialState: DetailsState(selectedDetails: .character),
                        //                                        reducer: detailsReducer,
                        //                                        environment: DetailsEnvironment()
                        //                                    ))
                        //                                } label: {
                        //                                    CharacterCard(сharacter: viewStore.characters[character])
                        //                                }
                        //                            }
                        //                        }
                        //                        .padding(.horizontal, 24)

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
