//
//  APIEndpoint.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//

import Foundation

enum EndpointPath: String {
    case baseUrl = "http://api.testDemoApp/iPradip/"
    case getStoreInfo = "/storeInfo"
    case getProductsDetails = "/products"
    case getOrderSummary = "/OrderSummary"
}

struct APIEndpoints {
    
    static func getStoreInfo() -> String {
        return "\(EndpointPath.baseUrl.rawValue)\(EndpointPath.getStoreInfo.rawValue)"
    }
    
    static func getProductDetails() -> String {
        return "\(EndpointPath.baseUrl.rawValue)\(EndpointPath.getProductsDetails.rawValue)"
    }
    
    static func getOrderSummary() -> String {
        return "\(EndpointPath.baseUrl.rawValue)\(EndpointPath.getOrderSummary.rawValue)"
    }
}
