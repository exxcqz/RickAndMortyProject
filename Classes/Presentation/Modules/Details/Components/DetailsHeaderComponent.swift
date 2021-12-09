//
//  Created by Nikita Gavrikov on 06.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct DetailsHeaderComponent: View {
    let currentDetails: Details
    let episode: Episode
    let character: Character
    let location: Location

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color(Asset.Colors.blackCard.name))
                    .frame(width: 148, height: 148)
                switch currentDetails {
                case .character:
                    Image(character.image)
                        .resizable()
                        .cornerRadius(16)
                        .frame(width: 148, height: 148)
                case .location:
                    Image(uiImage: location.type.icon)
                        .resizable()
                        .frame(width: 48, height: 48)
                case .episode:
                    Image(uiImage: Asset.TabBarIcons.icEpisodesNotActive.image)
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 48, height: 48)
                }
            }
            Text(getName)
                .font(Font.appFontBold(ofSize: 22))
                .foregroundColor(.white)
                .frame(height: 25)
                .padding(.top, 24)

            if !getStatus.isEmpty {
                Text(getStatus)
                    .font(Font.appFontMedium(ofSize: 16))
                    .foregroundColor(Color(Asset.Colors.primary.name))
                    .frame(height: 20)
                    .padding(.top, 8)
            }
        }
    }
}

extension DetailsHeaderComponent {

    var getName: String {
        switch currentDetails {
        case .character:
            return character.name
        case .location:
            return location.name
        case .episode:
            return episode.name
        }
    }

    var getStatus: String {
        switch currentDetails {
        case .character:
            return character.status
        default:
            return ""
        }
    }
}
