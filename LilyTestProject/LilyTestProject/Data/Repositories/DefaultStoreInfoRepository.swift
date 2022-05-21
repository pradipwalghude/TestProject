//
//  DefaultStoreInfoRepository.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//


import Foundation

struct DefaultStoreInfoRepository: StoreInfoRepository {
    
    let service: DefaultDataAPIService
    
    func fetchStoreInfo(for completion: @escaping (Result<StoreInfo, Error>) -> Void) {
        let endpoint = APIEndpoints.getStoreInfo()
        guard let url = URL(string: endpoint) else { return}
        
        service.fetchStoreInfo(for: url) { (result) in
            switch result {
            case .success(let responce): completion(.success(responce))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
