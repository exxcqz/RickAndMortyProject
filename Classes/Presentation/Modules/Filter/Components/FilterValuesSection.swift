//
//  Created by Alexander Loshakov on 13.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import SwiftUI

struct FilterValuesSection: View {
    @State var filterKey: Any // FilterState.CharacterFilter // если персонажей, то кейсы персонажей
//    @State var filterType: FilterState.FilterType // что мы сейчас фильтруем (персонажей или локации)
    @State var parameters: [String]
    @State var currentIndex: Int = 0
    @State var selectedIndex: Int?
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
                    countOfSelected: $countOfSelected
                ).frame(height: Layout.scaleFactorH * 28)
                    .padding([.horizontal, .vertical], 8)
                    .alignmentGuide(.leading, computeValue: { value in
                        if abs(width - value.width) > geo.size.width {
                            width = 0
                            height -= value.height
                        }
                        let result = width
                        if let last = self.parameters.last {
                            if parameters[index] == last {
                                width = 0
                            } else {
                                width -= value.width
                            }
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if let last = self.parameters.last {
                            if parameters[index] == last {
                                height = 0
                            }
                        }
                        return result
                    })
            }
            .onChange(of: resetAll) { _ in
                selectedIndex = nil
            }
            .onChange(of: selectedIndex) { newValue in
                if let newValue = newValue {
                    if let filterKey = filterKey as? FilterState.CharacterFilter {
                        let parameter: String = getParameterOfCharacters(filter: filterKey)
                        filterParamsDict[parameter] = parameters[newValue]
                    } else if let filterKey = filterKey as? FilterState.LocationsFilter {
                        let parameter: String = getParameterOfLocations(filter: filterKey)
                        filterParamsDict[parameter] = parameters[newValue]
                    }
                } else {
                    if let filterKey = filterKey as? FilterState.CharacterFilter {
                        let parameter: String = getParameterOfCharacters(filter: filterKey)
                        filterParamsDict[parameter] = nil
                    } else if let filterKey = filterKey as? FilterState.LocationsFilter {
                        let parameter: String = getParameterOfLocations(filter: filterKey)
                        filterParamsDict[parameter] = nil
                    }
                }
            }
        }
        .background(viewHeightReader($totalHeight))
    }

    private func getParameterOfCharacters(filter: FilterState.CharacterFilter) -> String {
        var parameter: String
        switch filter {
        case .status:
            parameter = "status"
        case .species:
            parameter = "species"
        case .type:
            parameter = "type"
        case .gender:
            parameter = "gender"
        }
        return parameter
    }

    private func getParameterOfLocations(filter: FilterState.LocationsFilter) -> String {
        var parameter: String
        switch filter {
        case .type:
            parameter = "type"
        case .dimension:
            parameter = "dimension"
        }
        return parameter
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
