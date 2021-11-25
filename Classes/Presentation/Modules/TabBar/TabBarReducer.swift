//
//  Created by Nikita Gavrikov on 22/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let tabBarReducer = Reducer<TabBarState, TabBarAction, TabBarEnvironment> { state, action, environment in
    switch action {
    case .selectedTabIDChange(let selectedTab):
        state.selectedTabID = selectedTab
        return .none
    }
}
