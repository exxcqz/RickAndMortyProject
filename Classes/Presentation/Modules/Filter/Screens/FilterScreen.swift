//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct FilterScreen: View {
    let store: Store<FilterState, FilterAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            let resetAll = viewStore.binding(
                get: {
                    $0.resetAll
                },
                send: FilterAction.resetAll
            )
            let countOfSelected = viewStore.binding(
                get: {
                    $0.countOfSelected
                },
                send: FilterAction.countOfSelectedChanged
            )
            let filterParamsDict = viewStore.binding(
                get: {
                    $0.tempFilterParams
                },
                send: FilterAction.filterParamsChanged
            )
            ZStack {
                VStack(spacing: 0) {
                    FilterBar(resetAll: resetAll, countOfSelected: countOfSelected)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 8) {
                            switch viewStore.filterType {
                            case .characters:
                                generateCharactersFilter(resetAll: resetAll, countOfSelected: countOfSelected, filterParamsDict: filterParamsDict)
                            case .locations:
                                generateLocationsFilter(resetAll: resetAll, countOfSelected: countOfSelected, filterParamsDict: filterParamsDict)
                            }
                        }
                        .padding(.horizontal, Layout.scaleFactorW * 16)
                        .padding(.top, Layout.scaleFactorH * 16)
                        .padding(.bottom, Layout.scaleFactorH * 16)
                    }.background(Color(Asset.Colors.blackCard.name))
                    FilterApplyButton(store: store)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }

    func generateCharactersFilter(resetAll: Binding<Bool>, countOfSelected: Binding<Int>, filterParamsDict: Binding<[String: String]>) -> some View {
        return ForEach(FilterState.CharacterFilter.allCases, id: \.self) { key in
            VStack(spacing: 8) {
                FilterKey(name: key.value)
                switch key {
                case .status:
                    let values: [String] = Character.CharacterStatus.allCases.map {
                        $0.rawValue.capitalized
                    }
                    FilterValuesSection(
                        filterKey: key,
                        parameters: values,
                        resetAll: resetAll,
                        countOfSelected: countOfSelected,
                        filterParamsDict: filterParamsDict
                    )
                case .species:
                    let values: [String] = Character.CharacterSpecies.allCases.map {
                        $0.rawValue.capitalized
                    }
                    FilterValuesSection(
                        filterKey: key,
                        parameters: values,
                        resetAll: resetAll,
                        countOfSelected: countOfSelected,
                        filterParamsDict: filterParamsDict
                    )
                case .type:
                    let values: [String] = Character.CharacterType.allCases.filter {
                        $0 != .noType
                    }.map {
                        $0.rawValue.capitalized
                    }
                    FilterValuesSection(
                        filterKey: key,
                        parameters: values,
                        resetAll: resetAll,
                        countOfSelected: countOfSelected,
                        filterParamsDict: filterParamsDict
                    )
                case .gender:
                    let values: [String] = Character.CharacterGender.allCases.map {
                        $0.rawValue.capitalized
                    }
                    FilterValuesSection(
                        filterKey: key,
                        parameters: values,
                        resetAll: resetAll,
                        countOfSelected: countOfSelected,
                        filterParamsDict: filterParamsDict
                    )
                }
            }
        }
    }

    func generateLocationsFilter(resetAll: Binding<Bool>, countOfSelected: Binding<Int>, filterParamsDict: Binding<[String: String]>) -> some View {
        return ForEach(FilterState.LocationsFilter.allCases, id: \.self) { key in
            VStack(spacing: 8) {
                switch key {
                case .type:
                    FilterKey(name: key.value)
                    let values: [String] = Location.LocationType.allCases.filter {
                        $0 != .noType
                    }.map {
                        $0.rawValue.capitalized
                    }
                    FilterValuesSection(
                        filterKey: key,
                        parameters: values,
                        resetAll: resetAll,
                        countOfSelected: countOfSelected,
                        filterParamsDict: filterParamsDict
                    )
                case .dimension:
                    FilterKey(name: key.value)
                    let values: [String] = Location.LocationDimension.allCases.filter {
                        $0 != .noDimension
                    }.map {
                        $0.rawValue.capitalized
                    }
                    FilterValuesSection(
                        filterKey: key,
                        parameters: values,
                        resetAll: resetAll,
                        countOfSelected: countOfSelected,
                        filterParamsDict: filterParamsDict
                    )
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
