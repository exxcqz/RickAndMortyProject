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
    func fetchEpisodes(withParameters: FetchingParameters) -> Effect<GeneralRequest<Episode>, NetworkError>
    func fetchMultipleEpisodes(withIds: [Int]) -> Effect<[Episode], NetworkError>
}
