//
//  Created by Александр Васильевич on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct SearchButton: View {
    let store: Store<CharactersState, CharactersAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            Button(
                action: {},
                label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: viewStore.scaleFactorH * 52)
                            .foregroundColor(Color(Asset.Colors.blackCard.name))
                        HStack {
                            Image(Asset.Icons.icSearchSmall.name)
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color(Asset.Colors.grayDark.name))
                                .frame(width: viewStore.scaleFactorW * 20, height: viewStore.scaleFactorH * 20)
                            Text(L10n.Placeholder.search)
                                .font(Font.appFontMedium(ofSize: 16))
                                .kerning(-0.32)
                                .foregroundColor(Color(Asset.Colors.grayDark.name))
                                .frame(height: viewStore.scaleFactorH * 20)
                        }
                    }
                }
            )
        }
    }
}
