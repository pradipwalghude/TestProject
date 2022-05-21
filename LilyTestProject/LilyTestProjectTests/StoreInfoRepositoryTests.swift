//
//  WeatherReportsRepositoryTests.swift
//  Demo AppTests
//
//  Created by Pradip Walghude on 5/21/22.
//

import XCTest
@testable import LilyTestProject

class StoreInfoRepositoryTests: XCTestCase {

    func testFetchStoreInfo_whenSuccess_thenRetunTeamReports(){
        let sut = DefaultStoreInfoRepository(service: DefaultDataAPIService())
        let expectation = self.expectation(description: "Fetch Weather Reports")
        var storeInfo: StoreInfo?
        //when
        sut.fetchStoreInfo() { result in
            switch result {
            case .success(let response): storeInfo = response
            case .failure(_): XCTFail("Should return reports")
            }
            expectation.fulfill()
        }
        //then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(storeInfo)
        XCTAssertEqual(storeInfo, stubStoreInfo())
    }
}
