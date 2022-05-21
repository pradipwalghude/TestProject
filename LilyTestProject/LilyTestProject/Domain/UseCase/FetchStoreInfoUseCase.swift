//
//  FetchStoreInfoUseCase.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//

import Foundation

protocol FetchStoreInfoUseCase {
    @discardableResult
    func execute(for completion: @escaping (Result<StoreInfo, Error>) -> Void)
}

struct DefaultFetchStoreInfoUseCase: FetchStoreInfoUseCase {
    let repository: StoreInfoRepository
    
    func execute(for completion: @escaping (Result<StoreInfo, Error>) -> Void)  {
        return repository.fetchStoreInfo(for: completion)
    }
}

