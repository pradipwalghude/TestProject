//
//  FlowCoordinator.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//

import UIKit

protocol FlowCoordinatorDependancies {
    func makeStoreInfoViewController() -> UIViewController
}

class FlowCoordinator {
    let dependencies: FlowCoordinatorDependancies
    var viewController: UIViewController?
    
    init(dependencies: FlowCoordinatorDependancies) {
        self.dependencies = dependencies
    }
    
    func start() {
        viewController = dependencies.makeStoreInfoViewController()
    }
    
}
