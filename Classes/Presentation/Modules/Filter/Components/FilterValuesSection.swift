//
//  Created by Alexander Loshakov on 13.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import SwiftUI

struct FilterValuesSection: View {
    @State var filterKey: Any
    @State var parameters: [String]
    @Binding var selectedIndex: Int?
    @Binding var countOfSelected: Int
    @Binding var filterParameters: FetchingParameters
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
            }.onChange(of: countOfSelected) { newCount in
                if newCount == 0 {
                    selectedIndex = nil
                }
            }.onChange(of: selectedIndex) { newValue in
                if let newValue = newValue {
                    setParameters(filter: filterKey, value: parameters[newValue])
                } else {
                    setParameters(filter: filterKey, value: nil)
                }
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func setParameters(filter: Any, value: String?) {
        switch filter {
        case let filter as FilterState.CharactersFilter:
            setParameterOfCharacters(filter: filter, value: value)
        case let filter as FilterState.LocationsFilter:
            setParameterOfLocations(filter: filter, value: value)
        default:
            break
        }
    }

    private func setParameterOfCharacters(filter: FilterState.CharactersFilter, value: String?) {
        switch filter {
        case .status:
            filterParameters.status = value
        case .species:
            filterParameters.species = value
        case .type:
            filterParameters.type = value
        case .gender:
            filterParameters.gender = value
        }
    }

    private func setParameterOfLocations(filter: FilterState.LocationsFilter, value: String?) {
        switch filter {
        case .type:
            filterParameters.type = value
        case .dimension:
            filterParameters.dimension = value
        }
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
