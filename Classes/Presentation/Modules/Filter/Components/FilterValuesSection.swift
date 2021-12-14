//
//  Created by Alexander Loshakov on 13.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import SwiftUI

struct FilterValuesSection: View {
    @State var filterKey: String
    @State var parameters: [String]
    @State var currentIndex: Int = 0
    @State var selectedIndex: Int = -1
    @Binding var resetAll: Bool
    @Binding var countOfSelected: Int
    @Binding var filterParamsDict: [String: String]

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
            ForEach(0..<self.parameters.count, id: \.self) { index in
                FilterValue(
                    value: parameters[index],
                    currentIndex: index,
                    selectedIndex: $selectedIndex,
                    countOfSelected: $countOfSelected // КОДСТАЙЛ
                ).frame(height: Layout.scaleFactorH * 28)
                    .padding([.horizontal, .vertical], 8)
                    .alignmentGuide(.leading, computeValue: { value in
                        if abs(width - value.width) > geo.size.width {
                            width = 0
                            height -= value.height
                        }
                        let result = width
                        if parameters[index] == self.parameters.last! {
                            width = 0
                        } else {
                            width -= value.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if parameters[index] == self.parameters.last! {
                            height = 0
                        }
                        return result
                    })
            }
            .onChange(of: resetAll) { _ in
                selectedIndex = -1
            }
            .onChange(of: selectedIndex) { newValue in
                filterParamsDict[filterKey] = newValue != -1 ? parameters[newValue] : nil
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

//struct FilterValuesSection_Previews: PreviewProvider {
//    @State var hideAll: Bool = false
//
//    static var previews: some View {
//        FilterValuesSection(
//            hideAll: $hideAll,
//            parameters: [
//                "Planet",
//                "Cluster",
//                "Space station",
//                "Microverse",
//                "TV",
//                "Resort",
//                "Fantasy town",
//                "Dream"
//            ]
//        )
//    }
//}
