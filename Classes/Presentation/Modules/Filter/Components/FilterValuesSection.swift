//
//  Created by Александр Васильевич on 13.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import SwiftUI

struct FilterValuesSection: View {
    var parameters: [String]

    @State private var totalHeight = CGFloat.zero

    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(geo: geometry)
            }
        }
        .frame(height: totalHeight)
    }

    private func generateContent(geo: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.parameters, id: \.self) { tag in
                FilterValue(value: tag)
                    .frame(height: Layout.scaleFactorH * 28)
                    .padding([.horizontal, .vertical], 8)
                    .alignmentGuide(.leading, computeValue: { value in
                        if abs(width - value.width) > geo.size.width {
                            width = 0
                            height -= value.height
                        }
                        let result = width
                        if tag == self.parameters.last! {
                            width = 0
                        } else {
                            width -= value.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if tag == self.parameters.last! {
                            height = 0
                        }
                        return result
                    })
            }
        }
        .background(viewHeightReader($totalHeight))
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

struct FilterValuesSection_Previews: PreviewProvider {
    static var previews: some View {
        FilterValuesSection(
            parameters: [
                "Planet",
                "Cluster",
                "Space station",
                "Microverse",
                "TV",
                "Resort",
                "Fantasy town",
                "Dream"
            ]
        )
    }
}
