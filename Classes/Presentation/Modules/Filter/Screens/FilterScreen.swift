//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct FilterScreen: View {
    let store: Store<FilterState, FilterAction>
    @State var resetAll: Bool = false
    @State var countOfSelected: Int = 0

    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                VStack(spacing: 0) {
                    FilterBar(resetAll: $resetAll, countOfSelected: $countOfSelected)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 8) {
                            switch viewStore.filterType {
                            case .characters:
                                generateCharactersFilter()
                            case .locations:
                                generateLocationsFilter()
                            }
                        }
                        .padding(.horizontal, Layout.scaleFactorW * 16)
                        .padding(.top, Layout.scaleFactorH * 16)
                        .padding(.bottom, Layout.scaleFactorH * 16)
                    }.background(Color(Asset.Colors.blackCard.name))
                    FilterApplyButton(store: store, countOfSelected: $countOfSelected) // параметр сделать в сторе
                }
                .edgesIgnoringSafeArea(.bottom)
            }

        }
    }

    func generateCharactersFilter() -> some View {
        return ForEach(FilterState.CharacterFilter.allCases, id: \.self) { value in
            VStack(spacing: 8) {
                switch value {
                case .status:
                    FilterKey(name: value.rawValue)
                    let values: [String] = Character.CharacterStatus.allCases.map { $0.rawValue }
                    FilterValuesSection(parameters: values, resetAll: $resetAll, countOfSelected: $countOfSelected)
                case .species:
                    FilterKey(name: value.rawValue)
                    let values: [String] = Character.CharacterSpecies.allCases.map { $0.rawValue }
                    FilterValuesSection(parameters: values, resetAll: $resetAll, countOfSelected: $countOfSelected)
                case .type:
                    FilterKey(name: value.rawValue)
                    let values: [String] = Character.CharacterType.allCases.filter {
                        $0 != .noType
                    }.map {
                        $0.rawValue
                    }

                    FilterValuesSection(parameters: values, resetAll: $resetAll, countOfSelected: $countOfSelected)
                case .gender:
                    FilterKey(name: value.rawValue)
                    let values: [String] = Character.CharacterGender.allCases.map { $0.rawValue }
                    FilterValuesSection(parameters: values, resetAll: $resetAll, countOfSelected: $countOfSelected)
                }
            }
        }
    }

    func generateLocationsFilter() -> some View {
        return ForEach(FilterState.LocationsFilter.allCases, id: \.self) { value in
            VStack(spacing: 8) {
                switch value {
                case .type:
                    FilterKey(name: value.rawValue)
                    let values: [String] = Location.LocationType.allCases.filter {
                        $0 != .noType
                    }.map {
                        $0.rawValue
                    }
                    FilterValuesSection(parameters: values, resetAll: $resetAll, countOfSelected: $countOfSelected)
                case .dimension:
                    FilterKey(name: value.rawValue)
                    let values: [String] = Location.LocationDimension.allCases.filter {
                        $0 != .noDimension
                    }.map {
                        $0.rawValue
                    }
                    FilterValuesSection(parameters: values, resetAll: $resetAll, countOfSelected: $countOfSelected)
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
