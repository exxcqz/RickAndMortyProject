//
//  Created by Nikita Gavrikov on 05.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct CharacterDetailsView: View {
    let store: Store<DetailsState, DetailsAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                Color(Asset.Colors.blackBG.name)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 0) {
                        DetailsHeaderComponent(
                            image: viewStore.character.image,
                            name: viewStore.character.name,
                            status: viewStore.character.status
                        )
                        DetailsInfoComponent(
                            species: viewStore.character.species,
                            type: viewStore.character.type,
                            gender: viewStore.character.gender
                        ).padding(.top, 24)
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
                        HStack {
                            Text("Episodes")
                                .font(Font.appFontSemibold(ofSize: 17))
                                .foregroundColor(.white)
                                .frame(height: 22)
                            Spacer()
                        }
                        .padding(.top, 24)
                        .padding(.leading, 24)
                        VStack(spacing: 16) {
                            ForEach(viewStore.episodes, id: \.id) { episode in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16)
                                        .foregroundColor(Color(Asset.Colors.blackCard.name))
                                        .frame(width: Layout.scaleFactorW * 327, height: 86)
                                    VStack(spacing: 16) {
                                        HStack {
                                            Text(episode.name)
                                                .font(Font.appFontSemibold(ofSize: 17))
                                                .frame(height: 22)
                                                .foregroundColor(.white)
                                            Spacer()
                                        }
                                        HStack {
                                            Text(episode.convertedEpisodeCode)
                                                .font(Font.appFontMedium(ofSize: 13))
                                                .frame(height: 18)
                                                .foregroundColor(Color(Asset.Colors.primary.name))
                                            Spacer()
                                            Text(episode.date)
                                                .font(Font.appFontMedium(ofSize: 12))
                                                .frame(height: 16)
                                                .foregroundColor(Color(Asset.Colors.grayDark.name))
                                        }
                                    }
                                    .padding(.horizontal, 39.25)
                                }
                            }
                        }
                        .padding(.top, 16)
                        .padding(.bottom, 16)
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Image(Asset.Icons.icBack.name))
        }
    }
}

extension String {

    var checkEmpty: String {
        if self.isEmpty {
            return "None"
        }
        return self
    }
}
