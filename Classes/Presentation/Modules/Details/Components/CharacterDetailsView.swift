//
//  Created by Nikita Gavrikov on 05.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct CharacterDetailsView: View {
    let store: Store<DetailsState, DetailsAction>
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                Color(Asset.Colors.blackBG.name)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 0) {
                        HStack(spacing: 0) {
                            Button(
                                action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Image(Asset.Icons.icBack.name)
                                }
                            )
                                .padding(.leading, 33)
                                .padding(.top, 66)
                            Spacer()
                        }
                        .frame(height: 92)
                        DetailsHeaderComponent(
                            image: viewStore.characters[0].image,
                            name: viewStore.characters[0].name,
                            status: viewStore.characters[0].status
                        ).padding(.top, 16)
                        DetailsInfoComponent(
                            species: viewStore.characters[0].species,
                            type: viewStore.characters[0].type,
                            gender: viewStore.characters[0].gender
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
                                EpisodeCard(episode: episode)
                                    .padding(.horizontal, 24)
                            }
                        }
                        .padding(.top, 16)
                        .padding(.bottom, 16)
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
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
