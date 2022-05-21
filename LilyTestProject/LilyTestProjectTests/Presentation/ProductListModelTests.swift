//
//  ProductListModelTests.swift
//  WeatherAppTests
//
//  Created by Pradip Walghude on 5/21/22.
//

import XCTest
@testable import LilyTestProject

class ProductListModelTests: XCTestCase {
   
    func testProductListViewModel_onSelectBookMarkLocation_shouldWeatherForecast() {
        let sut = makeSut()
        let expectation = self.expectation(description: "Fetch Product list Info")
        sut.didUpdateData = { _ in
            expectation.fulfill()
        }
        sut.loadProductList()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(sut.productList, stubProductsInfo().productList)
    }
    
    
    private func makeSut(with result: Result<StoreInfo, Error> = .success(stubStoreInfo())) -> ProductListViewModel {
        let repository = DefaultProductRepository(service: DefaultDataAPIService())
        let usecase = DefaultFetchProductUseCase(repository: repository)
        return  ProductListViewModel(with: usecase)
    }

}
