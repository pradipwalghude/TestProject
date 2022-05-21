//
//  WeatherModelTests.swift
//  Demo AppTests
//
//  Created by Pradip Walghude on 22/09/21.
//

import XCTest
@testable import LilyTestProject

class StoreInfoViewModelTests: XCTestCase {
   
    func testStoreInfoViewModel_onSelectBookMarkLocation_shouldWeatherForecast() {
        let sut = makeSut()
        let expectation = self.expectation(description: "Fetch Store Info")
        sut.didUpdateData = { _ in
            expectation.fulfill()
        }
        sut.loadStoreInfo()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(sut.storeInfo, stubStoreInfo())
    }
    
    
    private func makeSut(with result: Result<StoreInfo, Error> = .success(stubStoreInfo())) -> StoreInfoViewModel {
        let repository = DefaultStoreInfoRepository(service: DefaultDataAPIService())
        let usecase = DefaultFetchStoreInfoUseCase(repository: repository)
        return  StoreInfoViewModel(with: usecase)
    }

}
