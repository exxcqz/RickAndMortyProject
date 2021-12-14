//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

enum FilterAction: Equatable {
    case onAppear
    case resetAll
    case countOfSelectedChanged(Int)
    case filterParamsChanged([String: String])
    case applyFilter
    case onDisappear
}
