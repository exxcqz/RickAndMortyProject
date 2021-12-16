//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

enum CharactersAction: Equatable {
    case onAppear
    case fetchAnotherPage
    case characterCardSelected(Character)
    case dataLoaded(Result<GeneralRequest<Character>, NetworkError>)
    case searchInputChanged(String)
    case details(CharacterDetailsAction)
}
