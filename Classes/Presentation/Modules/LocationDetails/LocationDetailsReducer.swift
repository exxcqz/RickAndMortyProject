//
//  Created by Nikita Gavrikov on 12/12/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import ComposableArchitecture

let locationDetailsReducer = Reducer<LocationDetailsState, LocationDetailsAction, LocationDetailsEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
        if state.residents.isEmpty {
            state.location.residents.forEach { resident in
                let urlResident = URL(string: resident)
                let lastPathID = urlResident?.lastPathComponent
                guard let lastPathID = lastPathID,
                      let id = Int(lastPathID) else { return }
                state.indicies.append(id)
            }
            return environment.apiService.fetchMultipleCharacters(withIds: state.indicies)
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(LocationDetailsAction.dataLoaded)
        }
    case .dataLoaded(let result):
        switch result {
        case .success(let residents):
            state.residents += residents
            print("number of residents: \(state.residents.count)")
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    return .none
}
