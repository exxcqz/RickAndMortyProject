//
//  Created by Nikita Gavrikov on 28.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct LocationsCardComponent: View {
    let locationName: String
    let locationType: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color(Asset.Colors.blackCard.name))
                .frame(width: Layout.scaleFactorW * 327, height: 80, alignment: .center)
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(Asset.Colors.blackElements.name))
                        .frame(width: Layout.scaleFactorW * 64, height: 64)
                    Image(uiImage: pickIcons(typeLocations: locationType))
                        .resizable()
                        .scaledToFit()
                        .frame(width: Layout.scaleFactorW * 24, height: 24)
                }
                .padding(.leading, Layout.scaleFactorW * 32)
                .padding(.trailing, Layout.scaleFactorW * 16)
                VStack(alignment: .leading, spacing: 0) {
                    Text(locationName)
                        .font(Font.appFontSemibold(ofSize: Layout.scaleFactorW * 17))
                        .frame(height: 22)
                        .foregroundColor(.white)
                        .padding(.bottom, 4)
                    Text(locationType)
                        .font(Font.appFontMedium(ofSize: Layout.scaleFactorW * 13))
                        .frame(height: 18)
                        .foregroundColor(Color(Asset.Colors.primary.name))
                        .padding(.top, 4)
                }
                Spacer()
            }
        }
        .padding(.top, 8)
        .padding(.bottom, 8)
    }

    func pickIcons(typeLocations: String) -> UIImage {
        switch typeLocations {
        case "Planet": return Asset.Icons.icPlanet.image
        case "Cluster": return Asset.Icons.icCluster.image
        case "Space station": return Asset.Icons.icSpaceStation.image
        case "Microverse": return Asset.Icons.icMicroverse.image
        case "TV": return Asset.Icons.icTV.image
        case "Resort": return Asset.Icons.icResort.image
        case "Fantasy town": return Asset.Icons.icFantasyTown.image
        case "Dream": return Asset.Icons.icDream.image
        default: return Asset.Icons.icCluster.image
        }
    }
}
