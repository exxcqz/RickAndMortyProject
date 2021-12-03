//
//  Created by Alexander Loshakov on 18/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

let locationsReducer = Reducer<LocationsState, LocationsAction, LocationsEnvironment> { state, action, environment in
    switch action {
    case .updateLocationsData:
        state.locationsData.removeAll()
        listLocations.forEach { index in
            var icon = Asset.Icons.icCluster.image
            switch index.type {
            case .planet: icon = Asset.Icons.icPlanet.image
            case .cluster: icon = Asset.Icons.icCluster.image
            case .spaceStation: icon = Asset.Icons.icSpaceStation.image
            case .microverse: icon = Asset.Icons.icMicroverse.image
            case .tvType: icon =  Asset.Icons.icTV.image
            case .resort: icon = Asset.Icons.icResort.image
            case .fantasyTown: icon =  Asset.Icons.icFantasyTown.image
            case .dream: icon = Asset.Icons.icDream.image
            }
            state.locationsData.append(
                LocationsCardItem(
                    id: index.id,
                    name: index.name,
                    type: index.type,
                    icon: icon
                )
            )
        }
    case .getOffsetForHeader(let offset):
        let sizeOffScreen: CGFloat = Layout.scaleFactorH * 154
        if offset < -sizeOffScreen {
            let imageOffset = abs(min(-sizeOffScreen, offset))
            state.navigationOffset = imageOffset - sizeOffScreen
        }
        if offset > 0 {
            state.navigationOffset = -offset
        }

        state.navigationOffset = 0
    }
    return .none
}
