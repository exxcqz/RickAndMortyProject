//
//  Created by Anton Dityativ on 15/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

typealias HasServices = Any

private typealias HasPersistentServices = Any

// MARK: -  Singleton Services

private final class PersistentServiceContainer: HasPersistentServices {
    static var instance: PersistentServiceContainer = .init()

    private init() {}
}

// MARK: -  Regular Services

final class ServiceContainer: HasServices {
    lazy var charactersService: CharactersServiceProtocol = CharactersService()
    lazy var locationsService: LocationsServiceProtocol = LocationsService()
    lazy var episodesService: EpisodesServiceProtocol = EpisodesService()
}
