//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

enum CharactersAction: Equatable {
    // user selects the Characters tab and the view appears. action to send the API request and set ScaleFactor parameters
    case onAppear
    // user taps the Character card.
    case characterCardTapped(CharacterModel)
}
