//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import ComposableArchitecture

protocol HasEpisodesService {
    var profileService: EpisodesServiceProtocol { get }
}

protocol EpisodesServiceProtocol: AnyObject {
    func fetchAllEpisodes(currentPage: Int) -> Effect<GeneralRequest<Episode>, NetworkError>
    func fetchFilteredEpisodes(seasonNumber: Int) -> Effect<GeneralRequest<Episode>, NetworkError>
    func fetchMultipleEpisodes(withIds: [Int]) -> Effect<[Episode], NetworkError>
}
