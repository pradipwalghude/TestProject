//
//  StubResponses.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/19/22.
//


import Foundation

func stubStoreInfo() -> StoreInfo {
    return try! JSONDecoder().decode(StoreInfo.self, from: getDataFor(stub: stubStoreInfoString))
}

func stubProductsInfo() -> ProductsDetails {
    return try! JSONDecoder().decode(ProductsDetails.self, from: getDataFor(stub: stubProductsStrings))
}

func stubOrderDoneInfo() -> StoreInfo {
    return try! JSONDecoder().decode(StoreInfo.self, from: getDataFor(stub: stubOrderDoneStrings))
}

private func getDataFor(stub: String) -> Data {
    return stub.data(using: .utf8)!
}

