//
//  ProductRepository.swift
//  WeatherApp
//
//  Created by Pradip Walghude on 5/20/22.
//

import Foundation

protocol ProductRepository {
    func fetchProductList(for completion: @escaping (Result<ProductsDetails, Error>) -> Void)
}

