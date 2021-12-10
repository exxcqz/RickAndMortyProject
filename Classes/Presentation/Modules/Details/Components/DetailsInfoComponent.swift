//
//  Created by Nikita Gavrikov on 06.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct DetailsInfoComponent: View {
    let currentDetails: Details
    let episode: Episode
    let character: Character
    let location: Location

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text(L10n.Details.Info.title)
                    .font(Font.appFontSemibold(ofSize: Layout.scaleFactorW * 17))
                    .foregroundColor(.white)
                    .frame(height: 22)
                Spacer()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color(Asset.Colors.blackCard.name))
                    .frame(width: Layout.scaleFactorW * 327, height: Layout.scaleFactorW * height)
                VStack(spacing: 16) {
                    HStack {
                        Text(titleInfo.firstTitle)
                            .font(Font.appFontMedium(ofSize: Layout.scaleFactorW * 16))
                            .foregroundColor(Color(Asset.Colors.grayNormal.name))
                            .frame(height: 20)
                        Spacer()
                        Text(infoValue.firstValue)
                            .font(Font.appFontMedium(ofSize: Layout.scaleFactorW * 16))
                            .foregroundColor(.white)
                            .frame(height: 20)
                    }
                    HStack {
                        Text(titleInfo.secndTitle)
                            .font(Font.appFontMedium(ofSize: Layout.scaleFactorW * 16))
                            .foregroundColor(Color(Asset.Colors.grayNormal.name))
                            .frame(height: 20)
                        Spacer()
                        Text(infoValue.secondValue)
                            .font(Font.appFontMedium(ofSize: Layout.scaleFactorW * 16))
                            .foregroundColor(.white)
                            .frame(height: 20)
                    }
                    if !titleInfo.threeTitle.isEmpty {
                        HStack {
                            Text(titleInfo.threeTitle)
                                .font(Font.appFontMedium(ofSize: 16))
                                .foregroundColor(Color(Asset.Colors.grayNormal.name))
                                .frame(height: 20)
                            Spacer()
                            Text(infoValue.threeValue)
                                .font(Font.appFontMedium(ofSize: 16))
                                .foregroundColor(.white)
                                .frame(height: 20)
                        }
                    }
                }
                .padding(.horizontal, Layout.scaleFactorW * 16)
                .padding(.vertical, 16)
            }
        }
        .padding(.horizontal, Layout.scaleFactorW * 24)
    }
}

// MARK: -  Get values for Details Info

extension DetailsInfoComponent {

    var height: CGFloat {
        switch currentDetails {
        case .character:
            return 124
        case .location:
            return 96
        case .episode:
            return 136
        }
    }

    var titleInfo: (firstTitle: String, secndTitle: String, threeTitle: String) {
        switch currentDetails {
        case .character:
            return (L10n.Details.Info.species, L10n.Details.Info.type, L10n.Details.Info.gender)
        case .location:
            return (L10n.Details.Info.type, L10n.Details.Info.dimension, "")
        case .episode:
            return (L10n.Details.Info.episode, L10n.Details.Info.season, L10n.Details.Info.airDate)
        }
    }

    var infoValue: (firstValue: String, secondValue: String, threeValue: String) {
        switch currentDetails {
        case .character:
            return (character.species, character.type.checkEmpty, character.gender)
        case .location:
            return (location.type.rawValue, location.dimension, "")
        case .episode:
            return (episode.episodeCode, episode.episodeCode, episode.date)
        }
    }
}
