//
//  Created by Nikita Gavrikov on 26.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct LocationsNavigationComponent: View {
    let scaleFactorW: CGFloat = UIScreen.main.bounds.size.width / 375
    let scaleFactorH: CGFloat = UIScreen.main.bounds.size.height / 812
    let massive = [
        LocationsCardItem(id: 1, nameLocation: "Earth", typeLocation: "Portal", icon: Asset.Icons.icBarLocations.image),
        LocationsCardItem(id: 2, nameLocation: "Abadango", typeLocation: "Cluster", icon: Asset.Icons.icCluster.image),
        LocationsCardItem(id: 3, nameLocation: "Citadel", typeLocation: "Microversa", icon: Asset.Icons.icMicroverse.image),
        LocationsCardItem(id: 1, nameLocation: "Earth", typeLocation: "Portal", icon: Asset.Icons.icBarLocations.image),
        LocationsCardItem(id: 2, nameLocation: "Abadango", typeLocation: "Cluster", icon: Asset.Icons.icCluster.image),
        LocationsCardItem(id: 1, nameLocation: "Earth", typeLocation: "Portal", icon: Asset.Icons.icBarLocations.image),
        LocationsCardItem(id: 2, nameLocation: "Abadango", typeLocation: "Cluster", icon: Asset.Icons.icCluster.image),
        LocationsCardItem(id: 1, nameLocation: "Earth", typeLocation: "Portal", icon: Asset.Icons.icBarLocations.image),
        LocationsCardItem(id: 2, nameLocation: "Abadango", typeLocation: "Cluster", icon: Asset.Icons.icCluster.image),
        LocationsCardItem(id: 1, nameLocation: "Earth", typeLocation: "Portal", icon: Asset.Icons.icBarLocations.image),
        LocationsCardItem(id: 2, nameLocation: "Abadango", typeLocation: "Cluster", icon: Asset.Icons.icCluster.image),
        LocationsCardItem(id: 1, nameLocation: "Earth", typeLocation: "Portal", icon: Asset.Icons.icBarLocations.image),
        LocationsCardItem(id: 2, nameLocation: "Abadango", typeLocation: "Cluster", icon: Asset.Icons.icCluster.image)
    ]

    var body: some View {
        NavigationView {
            ZStack {
                Color(Asset.Colors.blackBG.name)
                VStack {
                    ZStack {
                        Image(Asset.Pictures.locations.name)
                            .resizable()
                            .frame(height: scaleFactorH * 248.0)
                        HStack {
                            Text(L10n.Locations.title)
                                .font(Font.appFontBold(ofSize: 28))
                                .padding(.leading, scaleFactorW * 24.0)
                                .foregroundColor(.white)
                                .frame(height: scaleFactorH * 34.0)
                            Spacer()
                        }
                        .padding(.top, scaleFactorH * 214.0)
                    }

                    ScrollView {
                        ForEach(massive, id: \.self) { card in
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(Color(Asset.Colors.blackCard.name))
                                    .frame(width: 327.0, height: 80.0, alignment: .center)
                                HStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(Color(Asset.Colors.blackElements.name))
                                            .frame(width: 64.0, height: 64.0)
                                        Image(uiImage: card.icon)
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                    }
                                    .padding(.leading, 32.0)
                                    .padding(.trailing, 16.0 )
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(card.nameLocation)
                                            .font(Font.appFontSemibold(ofSize: 17))
                                            .frame(height: 22)
                                            .foregroundColor(.white)
                                            .padding(.bottom, 4)
                                        Text(card.typeLocation)
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
                    }
                    .padding(.top, 8)
                }
            }
            .edgesIgnoringSafeArea(.all)
            //            .navigationBarHidden(true)
            //            .navigationBarTitle(L10n.Locations.title)
        }
    }
}

struct LocationsNavigationComponent_Previews: PreviewProvider {
    static var previews: some View {
        LocationsNavigationComponent()
    }
}
