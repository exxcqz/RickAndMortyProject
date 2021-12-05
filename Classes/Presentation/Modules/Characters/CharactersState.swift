//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import UIKit

struct CharactersState: Equatable {
    let navigationImage: String = Asset.Illustrations.characters.name
    let navigationTitle: String = L10n.Characters.title
    var data: [CharacterModel] = []
    var grid: [Int] = []
}
