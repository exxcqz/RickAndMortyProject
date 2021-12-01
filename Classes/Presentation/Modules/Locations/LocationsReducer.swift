//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

let locationsReducer = Reducer<LocationsState, LocationsAction, LocationsEnvironment> { state, action, environment in
    switch action {
    case .updateLocationsData:
        state.locationsData = listLocations
    case .pickIcon:
        state.locationsCardData = [LocationsCardItem]()
        state.locationsData.forEach { index in
            var icon = Asset.Icons.icPlanet.image
            switch index.type {
            case "Planet": icon = Asset.Icons.icPlanet.image
            case "Cluster": icon = Asset.Icons.icCluster.image
            case "Space station": icon = Asset.Icons.icSpaceStation.image
            case "Microverse": icon = Asset.Icons.icMicroverse.image
            case "TV": icon =  Asset.Icons.icTV.image
            case "Resort": icon = Asset.Icons.icResort.image
            case "Fantasy town": icon =  Asset.Icons.icFantasyTown.image
            case "Dream": icon = Asset.Icons.icDream.image
            default: icon = Asset.Icons.icPlanet.image
            }
            state.locationsCardData.append(
                LocationsCardItem(
                    id: index.id,
                    name: index.name,
                    type: index.type,
                    icon: icon
                )
            )
        }
    }
    return .none
}
