//
//  Created by Nikita Gavrikov on 06.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct DetailsHeaderComponent: View {
    var currentDetails: Details
    var episode: Episode
    var character: Character
    var location: Location

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color(Asset.Colors.blackCard.name))
                    .frame(width: Layout.scaleFactorW * 148, height: Layout.scaleFactorW * 148)
                switch currentDetails {
                case .character:
                    Image(character.image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(16)
                        .frame(width: Layout.scaleFactorW * 148, height: Layout.scaleFactorW * 148)
                case .location:
                    Image(uiImage: location.type.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: Layout.scaleFactorW * 48, height: Layout.scaleFactorW * 48)
                case .episode:
                    Image(uiImage: Asset.TabBarIcons.icEpisodesNotActive.image)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: Layout.scaleFactorW * 48, height: Layout.scaleFactorW * 48)
                }
            }
            Text(name)
                .font(Font.appFontBold(ofSize: Layout.scaleFactorW * 22))
                .foregroundColor(.white)
                .frame(height: 25)
                .padding(.top, 24)
            if !status.isEmpty {
                Text(status)
                    .font(Font.appFontMedium(ofSize: Layout.scaleFactorW * 16))
                    .foregroundColor(Color(Asset.Colors.primary.name))
                    .frame(height: 20)
                    .padding(.top, 8)
            }
        }
    }
}

// MARK: -  Get values for Details Header

extension DetailsHeaderComponent {

    var name: String {
        switch currentDetails {
        case .character:
            return character.name
        case .location:
            return location.name
        case .episode:
            return episode.name
        }
    }

    var status: String {
        switch currentDetails {
        case .character:
            return character.status
        default:
            return ""
        }
    }
}

// MARK: -  Check for empty value

extension String {

    var checkEmpty1: String {
        if self.isEmpty {
            return "None"
        }
        return self
    }
}
