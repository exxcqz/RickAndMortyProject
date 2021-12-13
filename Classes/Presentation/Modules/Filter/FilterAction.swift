//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

enum FilterAction: Equatable {
    case onAppear(type: FilterState.FilterType)
    case parameterSeleced(type: FilterState.FilterType, key: String, value: String)
    case resetAll
    case applyFilter
}
