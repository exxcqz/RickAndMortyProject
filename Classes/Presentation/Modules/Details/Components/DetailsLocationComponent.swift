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
                        VStack(spacing: 0) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(Color(Asset.Colors.blackCard.name))
                                    .frame(width: 148, height: 148)
                                Image(uiImage: viewStore.location.type.icon)
                                    .resizable()
                                    .frame(width: 48, height: 48)
                            }
                            Text(viewStore.location.name)
                                .font(Font.appFontBold(ofSize: 22))
                                .foregroundColor(.white)
                                .frame(height: 25)
                                .padding(.top, 24)
                        }
                        .padding(.top, 108)

                        VStack(spacing: 16) {
                            HStack {
                                Text("Info")
                                    .font(Font.appFontSemibold(ofSize: 17))
                                    .foregroundColor(.white)
                                    .frame(height: 22)
                                Spacer()
                            }
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(Color(Asset.Colors.blackCard.name))
                                    .frame(width: Layout.scaleFactorW * 327, height: 96)
                                VStack(spacing: 16) {
                                    HStack {
                                        Text("Type:")
                                            .font(Font.appFontMedium(ofSize: 16))
                                            .foregroundColor(Color(Asset.Colors.grayNormal.name))
                                            .frame(height: 20)
                                        Spacer()
                                        Text(viewStore.location.type.rawValue)
                                            .font(Font.appFontMedium(ofSize: 16))
                                            .foregroundColor(.white)
                                            .frame(height: 20)
                                    }
                                    HStack {
                                        Text("Dimension:")
                                            .font(Font.appFontMedium(ofSize: 16))
                                            .foregroundColor(Color(Asset.Colors.grayNormal.name))
                                            .frame(height: 20)
                                        Spacer()
                                        Text(viewStore.location.dimension)
                                            .font(Font.appFontMedium(ofSize: 16))
                                            .foregroundColor(.white)
                                            .frame(height: 20)
                                    }
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 16)
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 24)

                        HStack {
                            Text("Residents")
                                .font(Font.appFontSemibold(ofSize: 17))
                                .foregroundColor(.white)
                                .frame(height: 22)
                            Spacer()
                        }
                        .padding(.top, 24)
                        .padding(.leading, 24)

                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(0...8, id: \.self) { character in
                                NavigationLink {
                                    DetailsScreen(store: Store(
                                        initialState: DetailsState(selectedDetails: .character),
                                        reducer: detailsReducer,
                                        environment: DetailsEnvironment()
                                    ))
                                } label: {
                                    CharacterCard(сharacter: viewStore.characters[character])
                                }
                            }
                        }
                        .padding(.horizontal, 24)
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
