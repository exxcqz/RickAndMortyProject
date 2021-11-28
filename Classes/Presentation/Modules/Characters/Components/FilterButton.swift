//
//  Created by Александр Васильевич on 27.11.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct FilterButton: View {
    let store: Store<CharactersState, CharactersAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            Button(
                action: {},
                label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: viewStore.scaleFactorW * 52, height: viewStore.scaleFactorH * 52)
                            .foregroundColor(Color(Asset.Colors.blackCard.name))
                        Image(Asset.Icons.icFilter.name)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color(Asset.Colors.grayDark.name))
                            .scaledToFit()
                            .frame(width: viewStore.scaleFactorW * 24, height: viewStore.scaleFactorH * 24)
                    }
                }
            )
        }
    }
}
