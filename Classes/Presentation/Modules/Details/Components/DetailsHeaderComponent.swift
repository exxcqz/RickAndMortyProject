//
//  Created by Nikita Gavrikov on 06.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import SwiftUI

struct DetailsHeaderComponent: View {
    let image: String
    let name: String
    let status: String

    var body: some View {
        VStack(spacing: 0) {
            Image(image)
                .resizable()
                .cornerRadius(16)
                .frame(width: 148, height: 148)
            Text(name)
                .font(Font.appFontBold(ofSize: 22))
                .foregroundColor(.white)
                .frame(height: 25)
                .padding(.top, 24)
            Text(status)
                .font(Font.appFontMedium(ofSize: 16))
                .foregroundColor(Color(Asset.Colors.primary.name))
                .frame(height: 20)
                .padding(.top, 8)
        }
    }
}
