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

    /// Lazy service instances with dependencies from regular service container
    ///
    /// lazy var sessionService: SessionServiceProtocol = {
    ///     return SessionService(keychainService: ServiceContainer().keychainService)
    /// }()
}

// MARK: -  Regular Services

final class ServiceContainer: HasServices {

    /// lazy var keychainService: KeychainServiceProtocol = {
    ///     return KeychainService()
    /// }()

    /// var sessionService: SessionServiceProtocol {
    ///     return PersistentServiceContainer.instance.sessionService
    /// }
}
