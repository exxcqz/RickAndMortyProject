//
//  Created by Alexander Loshakov on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct CharacterCard: View {
    let сharacter: Character

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: Layout.scaleFactorW * 156, height: Layout.scaleFactorW * 202)
                .foregroundColor(Color(Asset.Colors.blackCard.name))
            VStack {
                Image(сharacter.image)
                    .resizable()
                    .cornerRadius(10)
                    .frame(width: Layout.scaleFactorW * 140, height: Layout.scaleFactorW * 140)
                    .padding(.top, Layout.scaleFactorW * 8)
                Spacer()
                Text(сharacter.name)
                    .font(Font.appFontSemibold(ofSize: Layout.scaleFactorW * 17))
                    .foregroundColor(.white)
                    .kerning(-0.41)
                    .padding(.vertical, Layout.scaleFactorW * 16)
                    .frame(width: Layout.scaleFactorW * 140, height: Layout.scaleFactorW * 22)
                Spacer()
            }
        }
    }
}