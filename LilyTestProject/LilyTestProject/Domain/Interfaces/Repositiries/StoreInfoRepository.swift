//
//  StoreInfoRepository.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//

import Foundation

protocol StoreInfoRepository {
    func fetchStoreInfo(for completion: @escaping (Result<StoreInfo, Error>) -> Void)
}
