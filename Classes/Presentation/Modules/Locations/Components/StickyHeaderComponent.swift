//
//  Created by Nikita Gavrikov on 03.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct StickyHeaderComponent: View {
    let store: Store<LocationsState, LocationsAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            GeometryReader { geo in
                let offset = geo.frame(in: .global).maxY
                ZStack {
                    Color(Asset.Colors.blackBG.name)
                    VStack(spacing: 0) {
                        ZStack {
                            if offset < Layout.scaleFactorH * 170 {
                                Color(Asset.Colors.blackBG.name)
                            } else {
                                NavigationImageComponent(
                                    image: viewStore.state.navigationImage
                                )
                            }
                            NavigationTitleComponent(
                                title: viewStore.state.navigationTitle
                            )
                        }
                        SearchAndFilter()
                    }
                }
                .offset(y: self.getOffsetForHeaderImage(geo))
            }
            .frame(height: Layout.scaleFactorH * 324)
            .zIndex(1)
        }
    }

    private func getOffsetForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = geometry.frame(in: .global).minY
        let sizeOffScreen: CGFloat = Layout.scaleFactorH * 154

        if offset < -sizeOffScreen {
            let imageOffset = abs(min(-sizeOffScreen, offset))
            return imageOffset - sizeOffScreen
        }

        if offset > 0 {
            return -offset
        }

        return 0
    }
}
