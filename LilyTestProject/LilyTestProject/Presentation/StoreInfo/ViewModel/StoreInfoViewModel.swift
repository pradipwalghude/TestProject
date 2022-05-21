//
//  StoreInfoViewModel.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//

import UIKit

class StoreInfoViewModel: NSObject {
    
    var storeInfo : StoreInfo?
    var didUpdateData: ((StoreInfo?) -> Void)?
    var didFailed: ((Error) -> Void)?
    private let fetchStoreInfoUseCase: FetchStoreInfoUseCase
    
    init(with fetchStoreInfoUseCase: FetchStoreInfoUseCase) {
        self.fetchStoreInfoUseCase = fetchStoreInfoUseCase
    }
    
    var storename: String? {
        storeInfo?.stores?.first?.name
    }
    
    var storeAddress: String? {
        "\(storeInfo?.stores?.first?.address?.streetAddressLine1 ?? ""), \(storeInfo?.stores?.first?.address?.streetAddressLine2 ?? "") \(storeInfo?.stores?.first?.address?.city ?? "") \(storeInfo?.stores?.first?.address?.postalCode ?? "")"
    }
    
    func loadStoreInfo() {
        self.fetchStoreInfoUseCase.execute { [weak self] result in
            switch result {
            case .success(let response):
                self?.storeInfo = response
                self?.didUpdateData?(response)
            case .failure(let error):
                self?.didFailed?(error)
            }
        }
   }

}
