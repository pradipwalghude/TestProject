//
//  ProductList.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//

import Foundation

struct ProductsDetails : Codable,Equatable {
    let productList : [ProductList]?
}

struct ProductList : Codable, Equatable {
    let productName : String?
    let description : String?
    let prize : String?
    let productImage : String?
    var quantity : Int
    let materialType : String?
    let productSequence : Int
    let discount : String?
}
