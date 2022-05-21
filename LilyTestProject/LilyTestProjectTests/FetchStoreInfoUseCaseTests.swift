//
//  FetchWeatherReportUseCaseTests.swift
//  Demo AppTests
//
//  Created by Pradip Walghude on 5/21/22.
//

import XCTest
@testable import LilyTestProject

class FetchStoreInfoUseCaseTests: XCTestCase {
    
    func testFetchStoreInfoUsecase_whenSuccess_thenReturnsWeatherReport() {
        //given
        let sut =  makeSUT(with: .success(stubStoreInfo()))
        let expectation = self.expectation(description: "Fetch weather reports")
        
        var storeInfo: StoreInfo?
        
        //when
        _ = sut.execute()  { result in
            switch result {
            case .success(let result): storeInfo = result
            case .failure(_): XCTFail("Should return weather reports")
            }
            expectation.fulfill()
        }
        
        //then
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNotNil(storeInfo)
        XCTAssertEqual(storeInfo?.stores?.first?.name, "Phoenix Marketcity Pune")
        XCTAssertEqual(storeInfo?.stores?.first?.address?.streetAddressLine1, "Ground floor, Phoenix Market City")
    }

    
    private func makeSUT(with result: Result<StoreInfo, Error>) -> FetchStoreInfoUseCase {
        let repository = DefaultStoreInfoRepository(service: DefaultDataAPIService())
        return DefaultFetchStoreInfoUseCase(repository: repository)
    }
}
