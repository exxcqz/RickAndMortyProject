//
//  Created by Alexander Loshakov on 07.12.2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation
import ComposableArchitecture

protocol HasLocationsService {
    var profileService: LocationsServiceProtocol { get }
}

protocol LocationsServiceProtocol: AnyObject {
    func fetchAllLocations(currentPage: Int) -> Effect<GeneralRequest<Location>, NetworkError>
    func fetchFilteredLocations(currentPage: Int, filterParam: [String], filterValue: [String]) -> Effect<GeneralRequest<Location>, NetworkError>
    func fetchMultipleLocations(withIds: [Int]) -> Effect<[Location], NetworkError>
}
