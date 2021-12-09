//
//  Created by Nikita Gavrikov on 09.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct DetailsScrollComponent: View {
    let store: Store<DetailsState, DetailsAction>
    let currentDetails: Details
    //    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        WithViewStore(store) { viewStore in
            HStack {
                Text(getTitle)
                    .font(Font.appFontSemibold(ofSize: 17))
                    .foregroundColor(.white)
                    .frame(height: 22)
                Spacer()
            }
            .padding(.top, 24)
            .padding(.leading, 24)
            LazyVGrid(columns: getColumns, spacing: 16) {
                ForEach(0...3, id: \.self) { index in
                    NavigationLink {
                        DetailsScreen(store: Store(
                            initialState: DetailsState(selectedDetails: getNextType),
                            reducer: detailsReducer,
                            environment: DetailsEnvironment()
                        ))
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
            .padding(.horizontal, 24)
            .padding(.top, 16)
            .padding(.bottom, 16)
        }
    }
}

extension DetailsScrollComponent {

    var getTitle: String {
        switch currentDetails {
        case .character:
            return "Episodes"
        case .location:
            return "Residents"
        case .episode:
            return "Characters"
        }
    }

    var getColumns: [GridItem] {
        switch currentDetails {
        case .character:
            return Array(repeating: .init(.flexible()), count: 1)
        case .location, .episode:
            return Array(repeating: .init(.flexible()), count: 2)
        }
    }

    var getNextType: Details {
        switch currentDetails {
        case .character:
            return .episode
        case .location, .episode:
            return .character
        }
    }
}
