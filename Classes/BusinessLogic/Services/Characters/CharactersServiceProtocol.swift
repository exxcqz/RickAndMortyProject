//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import ComposableArchitecture

protocol HasCharactersService {
    var profileService: CharactersServiceProtocol { get }
}

protocol CharactersServiceProtocol: AnyObject {
    func fetchAllCharacters(currentPage: Int) -> Effect<GeneralRequest<Character>, NetworkError>
    func fetchFilteredCharacters(currentPage: Int, filterParam: [String], filterValue: [String]) -> Effect<GeneralRequest<Character>, NetworkError>
    func fetchMultipleCharacters(withIds: [Int]) -> Effect<[Character], NetworkError>
}
