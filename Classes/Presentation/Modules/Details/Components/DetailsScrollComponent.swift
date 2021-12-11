//
//  Created by Nikita Gavrikov on 09.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct DetailsScrollComponent: View {
    let store: Store<DetailsState, DetailsAction>
    let currentDetails: Details
    let characters: [Character]
    let locations: [Location]
    let episodes: [Episode]

    var body: some View {
        WithViewStore(store) { viewStore in
            HStack {
                Text(title)
                    .font(Font.appFontSemibold(ofSize: Layout.scaleFactorW * 17))
                    .foregroundColor(.white)
                    .frame(height: 22)
                Spacer()
            }
            .padding(.top, 24)
            .padding(.leading, Layout.scaleFactorW * 24)
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(0..<countData, id: \.self) { index in
                    NavigationLink {
                        DetailsScreen(
                            store: Store(
                                initialState: DetailsState(selectedDetails: nextDetails),
                                reducer: detailsReducer,
                                environment: DetailsEnvironment()
                            )
                        ).onAppear {
                            switch currentDetails {
                            case .character:
                                viewStore.send(.updateStateEpisode(viewStore.episodes[index]))
                            case .location, .episode:
                                viewStore.send(.updateStateCharacter(viewStore.characters[index]))
                            }
                        }
                    } label: {
                        switch currentDetails {
                        case .character:
                            EpisodeCard(episode: viewStore.episodes[index])
                        case .location, .episode:
                            CharacterCard(сharacter: viewStore.characters[index])
                        }
                    }
                }
            }
            .padding(.horizontal, Layout.scaleFactorW * 24)
            .padding(.top, 16)
            .padding(.bottom, 16)
        }
    }
}

// MARK: -  Get values for Details Scroll

extension DetailsScrollComponent {

    var title: String {
        switch currentDetails {
        case .character:
            return L10n.Details.Character.scrollTitle
        case .location:
            return L10n.Details.Location.scrollTitle
        case .episode:
            return L10n.Details.Episode.scrollTitle
        }
    }

    var columns: [GridItem] {
        switch currentDetails {
        case .character:
            return Array(repeating: .init(.flexible()), count: 1)
        case .location, .episode:
            return Array(repeating: .init(.flexible()), count: 2)
        }
    }

    var nextDetails: Details {
        switch currentDetails {
        case .character:
            return .episode
        case .location, .episode:
            return .character
        }
    }

    var countData: Int {
        switch currentDetails {
        case .character:
            return episodes.count
        case .location, .episode:
            return characters.count
        }
    }
}
