//
//  Created by Nikita Gavrikov on 28.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct LocationsCardComponent: View {
    let locationName: String
    let locationType: String
    let scaleFactorW: CGFloat = UIScreen.main.bounds.size.width / 375
    let scaleFactorH: CGFloat = UIScreen.main.bounds.size.height / 812

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color(Asset.Colors.blackCard.name))
                .frame(width: scaleFactorW * 327.0, height: 80, alignment: .center)
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(Asset.Colors.blackElements.name))
                        .frame(width: scaleFactorW * 64.0, height: 64)
                    Image(uiImage: pickIcons(typeLocations: locationType))
                        .resizable()
                        .scaledToFit()
                        .frame(width: scaleFactorW * 24.0, height: 24)
                }
                .padding(.leading, scaleFactorW * 32.0)
                .padding(.trailing, scaleFactorW * 16.0 )
                VStack(alignment: .leading, spacing: 0) {
                    Text(locationName)
                        .font(Font.appFontSemibold(ofSize: 17))
                        .frame(height: 22)
                        .foregroundColor(.white)
                        .padding(.bottom, 4)
                    Text(locationType)
                        .font(Font.appFontMedium(ofSize: 13))
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
