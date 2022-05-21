//
//  NetworkManager.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//

import Foundation


class DefaultDataAPIService {
    
    func fetchStoreInfo(for url: URL, with completion: @escaping (Result<StoreInfo, Error>) -> Void)  {
        
        completion(.success(stubStoreInfo()))
        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let err = error {
//                completion(.failure(err))
//            }
//            guard let data = data else {return}
//            do {
//                let cityData = try JSONDecoder().decode(StoreInfo.self, from: data)
//                 completion(.success(cityData))
//            } catch let jsonError {
//                completion(.failure(jsonError))
//            }
//        }.resume()
    }
    
    func fetchProductList(for url: URL, with completion: @escaping (Result<ProductsDetails, Error>) -> Void)  {
        completion(.success(stubProductsInfo()))
    }
    
}
