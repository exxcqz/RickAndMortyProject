//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct FilterScreen: View {
//    @Binding var resetAll: Bool
    let store: Store<FilterState, FilterAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                VStack(spacing: 0) {
                    // Шапка
                    FilterBar()
//                        .border(.green)

                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 8) {
                            ForEach(1...3, id: \.self) { value in
                                VStack(spacing: 8) {
                                    FilterKey(name: "Status")
//                                        .border(.green)
                                    FilterValuesSection(parameters: ["Planet", "Cluster", "Space station", "Microverse", "TV", "Resort", "Fantasy town", "Dream"])
                                }
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
