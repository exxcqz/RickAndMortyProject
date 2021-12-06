//
//  Created by Alexander Loshakov on 03.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct EpisodeCard: View {
    let data: Episode
    var episodeCodeReadable: String {
        guard let episode = data.convertedEpisodeCode?.episodeNumber,
              let season = data.convertedEpisodeCode?.seasonNumber else {
            return "Unknown episode code"
        }
        return "Episode: \(episode), Season: \(season)"
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: Layout.scaleFactorW * 327, height: Layout.scaleFactorW * 86)
                .foregroundColor(Color(Asset.Colors.blackCard.name))
            VStack(spacing: 0) {
                HStack {
                    Text(data.name)
                        .font(Font.appFontSemibold(ofSize: Layout.scaleFactorW * 17))
                        .foregroundColor(.white)
                        .kerning(-0.41)
                    Spacer()
                }
                .padding(.top, Layout.scaleFactorW * 16)
                .padding(.leading, Layout.scaleFactorW * 15.25)
                .padding(.bottom, Layout.scaleFactorW * 16)
                HStack {
                    Text(episodeCodeReadable)
                        .font(Font.appFontMedium(ofSize: Layout.scaleFactorW * 13))
                        .foregroundColor(Color(Asset.Colors.primary.name))
                        .kerning(-0.08)
                        .padding(.leading, Layout.scaleFactorW * 15.25)
                        .frame(height: Layout.scaleFactorW * 18)
                    Spacer()
                    Text(data.date)
                        .font(Font.appFontMedium(ofSize: Layout.scaleFactorW * 12))
                        .foregroundColor(Color(Asset.Colors.grayDark.name))
                        .padding(.trailing, Layout.scaleFactorW * 15.86)
                        .frame(height: Layout.scaleFactorW * 16)
                }
                .frame(height: 18)
                .padding(.bottom, Layout.scaleFactorW * 14)
            }
        }
    }
}

struct EpisodeCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            if !dummyEpisodesArray.isEmpty {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing : Layout.scaleFactorW * 16) {
                        HStack(spacing: Layout.scaleFactorW * 16) {
                            EpisodeCard(data: dummyEpisodesArray[0])
                        }
                    }
                    .padding(.horizontal, Layout.scaleFactorW * 23)
                }
            }
        }
    }
}
