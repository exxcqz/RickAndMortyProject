//
//  Created by Александр Васильевич on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import ComposableArchitecture

protocol HasApiService {
    var profileService: ApiServiceProtocol { get }
}

protocol ApiServiceProtocol: AnyObject {
    func fetchCharacters(currentPage: Int) -> Effect<GeneralRequest<Character>, NetworkError>
    func fetchLocations(currentPage: Int) -> Effect<GeneralRequest<Location>, NetworkError>
    func fetchEpisodes(currentPage: Int) -> Effect<GeneralRequest<Episode>, NetworkError>
}
