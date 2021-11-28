//
//  Created by Александр Васильевич on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct CharacterCard: View {
    @Binding var scaleFactorW: CGFloat
    @Binding var scaleFactorH: CGFloat
    let data: CharacterModel

    var body: some View {

        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: scaleFactorW * 156, height: scaleFactorH * 202)
                .foregroundColor(Color(Asset.Colors.blackCard.name))
            VStack {
                Image("dummyCharacterImage")
                    .resizable()
//                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .frame(width: scaleFactorW * 140, height: scaleFactorH * 140)
                    .padding(.top, scaleFactorH * 8)
                Spacer()
                Text(data.name)
                    .font(Font.appFontSemibold(ofSize: 17))
                    .foregroundColor(.white)
                    .kerning(-0.41)
                    .padding(.vertical, scaleFactorH * 16)
                    .frame(width: scaleFactorW * 140, height: scaleFactorH * 22)
                Spacer()
            }
        }
        .onTapGesture {
            print("\(self.data.name) selected")
        }

    }
}
