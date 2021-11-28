//
//  Created by Александр Васильевич on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct NavigationView: View {
    let store: Store<CharactersState, CharactersAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                Image(Asset.Pictures.characters.name)
                    .resizable()
                    .frame(height: viewStore.scaleFactorW * 248.0)
                HStack {
                    Text(L10n.Characters.title)
                        .font(Font.appFontBold(ofSize: 28))
                        .padding(.leading, viewStore.scaleFactorW * 24)
                        .foregroundColor(.white)
                        .frame(height: viewStore.scaleFactorH * 34)
                    Spacer()
                }
                .padding(.top, viewStore.scaleFactorH * 214)
            }
            .frame(width: viewStore.scaleFactorW * 375, height: viewStore.scaleFactorH * 248)
        }
    }
}
