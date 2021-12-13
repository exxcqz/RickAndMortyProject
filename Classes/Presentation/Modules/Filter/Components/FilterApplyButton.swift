//
//  Created by Alexander Loshakov on 13.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct FilterApplyButton: View {
    let store: Store<FilterState, FilterAction>
    @Binding var countOfSelected: Int

    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                Rectangle()
                    .frame(
                        width: Layout.scaleFactorW * 375,
                        height: Layout.scaleFactorH * 96
                    )
                    .foregroundColor(Color(Asset.Colors.blackCard.name))
                Button(
                    action: {
                        // действие в редьюсер: передать словарь параметров на экран и выполнить запрос
                    },
                    label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: Layout.scaleFactorW * 12)
                                .frame(
                                    width: Layout.scaleFactorW * 327,
                                    height: Layout.scaleFactorH * 54
                                )
                                .foregroundColor(
                                    countOfSelected > 0
                                    ? Color(Asset.Colors.primary.name)
                                    : Color(.white).opacity(0.1)
                                )
                            Text(L10n.Filters.Action.apply)
                                .font(Font.appFontSemibold(ofSize: Layout.scaleFactorW * 17))
                                .foregroundColor(.white)
                        }
                    }
                ).disabled(countOfSelected == 0)
            }
        }
    }
}

//struct FilterApplyButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterApplyButton(
//            store: Store(
//                initialState: FilterState(),
//                reducer: filterReducer,
//                environment: FilterEnvironment()
//            ),
//            countOfSelected: <#Binding<Int>#>
//        )
//    }
//}
