//
//  Created by Nikita Gavrikov on 03.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct StickyHeaderComponent: View {
    let navigationImage: String
    let navigationTitle: String
    let heightForHide = Layout.scaleFactorH * 170

    var body: some View {
        GeometryReader { geo in
            let offset = geo.frame(in: .global).maxY
            ZStack {
                Color(Asset.Colors.blackBG.name)
                VStack(spacing: 0) {
                    ZStack {
                        if offset < heightForHide {
                            Color(Asset.Colors.blackBG.name)
                        } else {
                            NavigationImageComponent(image: navigationImage)
                        }
                        NavigationTitleComponent(title: navigationTitle)
                    }
                    SearchAndFilter()
                }
            }
            .offset(y: geo.getOffsetForHeader)
        }
        .frame(height: Layout.scaleFactorH * 324)
        .zIndex(1)
    }
}

// MARK: -  Get Offset For Sticky Header

extension GeometryProxy {

    var getOffsetForHeader: CGFloat {
        let offset = self.frame(in: .global).minY
        let sizeOffScreen: CGFloat = Layout.scaleFactorH * 154
        if offset < -sizeOffScreen {
            let headerOffset = abs(min(-sizeOffScreen, offset))
            return headerOffset - sizeOffScreen
        }
        if offset > 0 {
            return CGFloat(-offset)
        }
        return 0
    }
}
