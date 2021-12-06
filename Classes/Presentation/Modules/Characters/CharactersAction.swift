//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

enum CharactersAction: Equatable {
    case onAppear
    case characterCardSelected(Character)
    case searchFor(String)
}
