//
//  FetchProductUseCase.swift
//  WeatherApp
//
//  Created by Pradip Walghude on 5/20/22.
//

import Foundation

protocol FetchProductUseCase {
    @discardableResult
    func execute(for completion: @escaping (Result<ProductsDetails, Error>) -> Void)
}

struct DefaultFetchProductUseCase: FetchProductUseCase {
    let repository: ProductRepository
    
    func execute(for completion: @escaping (Result<ProductsDetails, Error>) -> Void)  {
        return repository.fetchProductList(for: completion)
    }
}

