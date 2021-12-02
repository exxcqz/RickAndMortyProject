//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import UIKit

struct CharactersState: Equatable {
    var data: [CharacterModel] = []
    var grid: [Int] = []
}
