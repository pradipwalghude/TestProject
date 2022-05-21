//
//  ProductListViewModel.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//

import UIKit

class ProductListViewModel: NSObject {

    var productList : [ProductList]?
    var didUpdateData: ((ProductsDetails?) -> Void)?
    var didFailed: ((Error) -> Void)?
    private let fetchProductUseCase: FetchProductUseCase
    
    init(with fetchProductUseCase: FetchProductUseCase) {
        self.fetchProductUseCase = fetchProductUseCase
    }
   
    var numberOfItems: Int {
        return productList?.count ?? 0
    }
    
    var isCartSummaryButtonVisible: Bool? {
        return productList?.filter({ $0.quantity == 1}).count ?? 0 < 1
    }
    
    var cartProductList: CartSummaryViewModel {
        return CartSummaryViewModel(with: productList?.filter { $0.quantity == 1 } ?? [])
    }
    
    
    func cellViewModel(for indexPath: IndexPath) -> ProductList? {
        return productList?[indexPath.row]
    }
    
    func addToCart(for productSequence: Int, quantity: Int) {
        var updatedProduct = productList?.first(where: { $0.productSequence == productSequence })
        updatedProduct?.quantity = quantity
        productList = productList?.map { $0.productSequence  == productSequence ? updatedProduct : $0} as? [ProductList]
    }
    
    
    func loadProductList() {
        self.fetchProductUseCase.execute { [weak self] result in
            switch result {
            case .success(let response):
                self?.productList = response.productList
                self?.didUpdateData?(response)
            case .failure(let error):
                self?.didFailed?(error)
            }
        }
   }
    
}
