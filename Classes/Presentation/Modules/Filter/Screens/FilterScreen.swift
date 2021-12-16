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
            let countOfSelected = viewStore.binding(
                get: {
                    $0.countOfSelected
                },
                send: FilterAction.countOfSelectedChanged
            )
            let filterParameters = viewStore.binding(
                get: {
                    $0.appliedParameters
                },
                send: FilterAction.filterParametersChanged
            )
            let indicesOfCharactersFilter = viewStore.binding(
                get: {
                    $0.indicesOfCharactersFilter
                },
                send: FilterAction.indicesOfCharactersChanged
            )
            let indicesOfLocationsFilter = viewStore.binding(
                get: {
                    $0.indicesOfLocationsFilter
                },
                send: FilterAction.indicesOfLocationsChanged
            )

            ZStack {
                VStack(spacing: 0) {
                    FilterBar(countOfSelected: countOfSelected)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 8) {
                            switch viewStore.filterType {
                            case .characters:
                                generateCharactersFilter(
                                    countOfSelected: countOfSelected,
                                    filterParameters: filterParameters,
                                    indices: indicesOfCharactersFilter
                                )
                            case .locations:
                                generateLocationsFilter(
                                    countOfSelected: countOfSelected,
                                    filterParameters: filterParameters,
                                    indices: indicesOfLocationsFilter
                                )
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

    func generateCharactersFilter(countOfSelected: Binding<Int>, filterParameters: Binding<FetchingParameters>, indices: Binding<[Int?]>) -> some View {
        return ForEach(FilterState.CharactersFilter.allCases, id: \.self) { key in
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
                        selectedIndex: indices[0],
                        countOfSelected: countOfSelected,
                        filterParameters: filterParameters
                    )
                case .species:
                    let values: [String] = Character.CharacterSpecies.allCases.map {
                        $0.rawValue.capitalized
                    }
                    FilterValuesSection(
                        filterKey: key,
                        parameters: values,
                        selectedIndex: indices[1],
                        countOfSelected: countOfSelected,
                        filterParameters: filterParameters
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
                        selectedIndex: indices[2],
                        countOfSelected: countOfSelected,
                        filterParameters: filterParameters
                    )
                case .gender:
                    let values: [String] = Character.CharacterGender.allCases.map {
                        $0.rawValue.capitalized
                    }
                    FilterValuesSection(
                        filterKey: key,
                        parameters: values,
                        selectedIndex: indices[3],
                        countOfSelected: countOfSelected,
                        filterParameters: filterParameters
                    )
                }
            }
        }
    }

    func generateLocationsFilter(countOfSelected: Binding<Int>, filterParameters: Binding<FetchingParameters>, indices: Binding<[Int?]>) -> some View {
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
                        selectedIndex: indices[0],
                        countOfSelected: countOfSelected,
                        filterParameters: filterParameters
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
                        selectedIndex: indices[1],
                        countOfSelected: countOfSelected,
                        filterParameters: filterParameters
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
