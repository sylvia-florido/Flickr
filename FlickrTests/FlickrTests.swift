//
//  FlickrTests.swift
//  FlickrTests
//
//  Created by Silvia Florido on 18/06/24.
//

import XCTest
@testable import Flickr

final class FlickrTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let expectedResult = FlickrImagesList.exampleList().items
        let fetcher = FlickrFetcher(service: APIMockService())
        
        fetcher.fetchFlickrImages(by: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            XCTAssertEqual(fetcher.images, expectedResult)
        })
    }
}
