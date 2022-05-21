//
//  Module.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//

import UIKit

public struct ModuleDependencies {
    let apiDataTransferService: DefaultDataAPIService
    
     init (apiDataTransferService: DefaultDataAPIService) {
        self.apiDataTransferService = apiDataTransferService
    }
}

public struct Module {
    private let diContainer: DIContainer
    
    public init(dependencies: ModuleDependencies) {
        self.diContainer = DIContainer(dependencies: dependencies)
    }
    
    public func myHomeViewController() -> UIViewController {
        let coordinator = self.diContainer.makeMyCompCoordinator()
        coordinator.start()
        return coordinator.viewController ?? UIViewController()
    }
}
