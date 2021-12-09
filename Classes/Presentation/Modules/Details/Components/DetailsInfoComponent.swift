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
                Text("Info")
                    .font(Font.appFontSemibold(ofSize: 17))
                    .foregroundColor(.white)
                    .frame(height: 22)
                Spacer()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color(Asset.Colors.blackCard.name))
                    .frame(width: Layout.scaleFactorW * 327, height: getHeight)
                VStack(spacing: 16) {
                    HStack {
                        Text(getTitleInfo.firstTitle)
                            .font(Font.appFontMedium(ofSize: 16))
                            .foregroundColor(Color(Asset.Colors.grayNormal.name))
                            .frame(height: 20)
                        Spacer()
                        Text(getValue.firstValue)
                            .font(Font.appFontMedium(ofSize: 16))
                            .foregroundColor(.white)
                            .frame(height: 20)
                    }
                    HStack {
                        Text(getTitleInfo.secndTitle)
                            .font(Font.appFontMedium(ofSize: 16))
                            .foregroundColor(Color(Asset.Colors.grayNormal.name))
                            .frame(height: 20)
                        Spacer()
                        Text(getValue.secondValue)
                            .font(Font.appFontMedium(ofSize: 16))
                            .foregroundColor(.white)
                            .frame(height: 20)
                    }
                    if !getTitleInfo.threeTitle.isEmpty {
                        HStack {
                            Text(getTitleInfo.threeTitle)
                                .font(Font.appFontMedium(ofSize: 16))
                                .foregroundColor(Color(Asset.Colors.grayNormal.name))
                                .frame(height: 20)
                            Spacer()
                            Text(getValue.threeValue)
                                .font(Font.appFontMedium(ofSize: 16))
                                .foregroundColor(.white)
                                .frame(height: 20)
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
            }
        }
        .padding(.horizontal, 24)
    }
}

extension DetailsInfoComponent {

    var getHeight: CGFloat {
        switch currentDetails {
        case .character:
            return 124
        case .location:
            return 96
        case .episode:
            return 136
        }
    }

    var getTitleInfo: (firstTitle: String, secndTitle: String, threeTitle: String) {
        switch currentDetails {
        case .character:
            return ("Species:", "Type:", "Gender:")
        case .location:
            return ("Type:", "Dimension:", "")
        case .episode:
            return ("Episode:", "Season:", "Air date:")
        }
    }

    var getValue: (firstValue: String, secondValue: String, threeValue: String) {
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
