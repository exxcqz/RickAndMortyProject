//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct FilterScreen: View {
//    @Binding var resetAll: Bool
    let store: Store<FilterState, FilterAction>
    @State var filterType: FilterType = FilterType.locations

    enum FilterType: CaseIterable {
        case characters
        case locations
    }

    enum CharacterFilter: String, CaseIterable {
        case status = "Status"
        case species = "Species"
        case type = "Type"
        case gender = "Gender"
    }

    enum LocationsFilter: String, CaseIterable {
        case type = "Type"
        case dimension = "Dimension"
    }

    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                VStack(spacing: 0) {
                    FilterBar()

                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 8) {
                            switch self.filterType {
                            case .characters:
                                generateCharactersFilter()
                            case .locations:
                                generateLocationsFilter()
                            }
                        }
                        .padding(.horizontal, Layout.scaleFactorW * 16)
                        .padding(.top, Layout.scaleFactorH * 16)
                        .padding(.bottom, Layout.scaleFactorH * 16)
                    }
                    .background(Color(Asset.Colors.blackCard.name))

                    FilterApplyButton()

                }
                .edgesIgnoringSafeArea(.bottom)
            }

        }
    }

    func generateCharactersFilter() -> some View {
        return ForEach(CharacterFilter.allCases, id: \.self) { value in
            VStack(spacing: 8) {
                switch value {
                case .status:
                    FilterKey(name: value.rawValue)
                    let values: [String] = Character.CharacterStatus.allCases.map { $0.rawValue }
                    FilterValuesSection(parameters: values)
                case .species:
                    FilterKey(name: value.rawValue)
                    let values: [String] = Character.CharacterSpecies.allCases.map { $0.rawValue }
                    FilterValuesSection(parameters: values)
                case .type:
                    FilterKey(name: value.rawValue)
                    let values: [String] = Character.CharacterType.allCases.filter {
                        $0 != .noType
                    }.map {
                        $0.rawValue
                    }

                    FilterValuesSection(parameters: values)
                case .gender:
                    FilterKey(name: value.rawValue)
                    let values: [String] = Character.CharacterGender.allCases.map { $0.rawValue }
                    FilterValuesSection(parameters: values)
                }
            }
        }
    }

    func generateLocationsFilter() -> some View {
        return ForEach(LocationsFilter.allCases, id: \.self) { value in
            VStack(spacing: 8) {
                switch value {
                case .type:
                    FilterKey(name: value.rawValue)
                    let values: [String] = Location.LocationType.allCases.filter {
                        $0 != .noType
                    }.map {
                        $0.rawValue
                    }
                    FilterValuesSection(parameters: values)
                case .dimension:
                    FilterKey(name: value.rawValue)
                    let values: [String] = Location.LocationDimension.allCases.filter {
                        $0 != .noDimension
                    }.map {
                        $0.rawValue
                    }

                    FilterValuesSection(parameters: values)
                }
            }
        }
    }
}

struct FilterScreen_Previews: PreviewProvider {
    static var previews: some View {
        FilterScreen(
            store: Store(
                initialState: FilterState(),
                reducer: filterReducer,
                environment: FilterEnvironment()
            )
        )
    }
}
