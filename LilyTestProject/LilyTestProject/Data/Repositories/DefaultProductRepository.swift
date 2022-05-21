//
//  DefaultProductRepository.swift
//  WeatherApp
//
//  Created by Pradip Walghude on 5/20/22.
//

import Foundation

struct DefaultProductRepository: ProductRepository {
    let service: DefaultDataAPIService
    
    func fetchProductList(for completion: @escaping (Result<ProductsDetails, Error>) -> Void) {
        let endpoint = APIEndpoints.getProductDetails()
        guard let url = URL(string: endpoint) else { return}
        
        service.fetchProductList(for: url) { (result) in
            switch result {
            case .success(let responce): completion(.success(responce))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
