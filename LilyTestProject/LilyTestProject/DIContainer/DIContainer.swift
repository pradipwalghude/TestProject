//
//  DIContainer.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//

import UIKit

final class DIContainer {
    
    private let dependencies: ModuleDependencies
    
    init(dependencies: ModuleDependencies) {
        self.dependencies = dependencies
    }
    
    //MARK:- MyComp View composition
    public func makeMyCompCoordinator() -> FlowCoordinator {
        let coordinator = FlowCoordinator(dependencies: self)
        return coordinator
    }
    
    private func makeFetchStoreInfoUseCase() -> FetchStoreInfoUseCase {
        return DefaultFetchStoreInfoUseCase(repository: makeStoreInfoRepository())
    }
    
    private func makeStoreInfoRepository() -> StoreInfoRepository {
        return DefaultStoreInfoRepository(service: dependencies.apiDataTransferService)
    }
    
}

extension DIContainer: FlowCoordinatorDependancies {
   
    func makeStoreInfoViewController() -> UIViewController {
        let storeInfoViewController = StoreInfoViewController.instantiate(from: .Home)
        storeInfoViewController.viewModel = StoreInfoViewModel(with: makeFetchStoreInfoUseCase())
        return UINavigationController(rootViewController: storeInfoViewController)
    }
    
}
