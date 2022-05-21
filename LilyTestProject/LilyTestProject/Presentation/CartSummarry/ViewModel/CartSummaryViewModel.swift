//
//  CartSummaryViewModel.swift
//  WeatherApp
//
//  Created by Pradip Walghude on 5/21/22.
//

import UIKit

class CartSummaryViewModel: NSObject {
    
    var productList : [ProductList]?
    
    init(with productList: [ProductList]) {
        self.productList = productList
    }
    
    var numberOfItems: Int {
        return productList?.count ?? 0
    }
    
    func cellViewModel(for indexPath: IndexPath) -> ProductList? {
        return productList?[indexPath.row]
    }

}
