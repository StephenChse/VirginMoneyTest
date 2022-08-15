//
//  UIImageViewAdditionTest.swift
//  Virgin_TestTests
//
//  Created by Chase on 15/08/2022.
//

import Foundation

import XCTest
@testable import Virgin_Test

class ImageDownloadTest: XCTestCase {

    var sut: ImageLoader!
    override func setUpWithError() throws {
        sut = ImageLoader()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testDownloadImageURL() {
        guard let url = URL(string: "https://cdn.pixabay.com/photo/2017/02/09/21/08/wings-2053515__340.png") else { return }
        let expectation = expectation(description: "Image downloaded from url")
        sut.loadImageWithUrl(url) {
            XCTAssertNotNil(self.sut.image?.pngData)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

    func testDownloadImageWithFakeURL() {
        guard let fakeUrl = URL(string: "https://cdn.pixabay.com/2017/02/09/21/08/wings-2053515__340") else { return }
        let expectation = expectation(description: "Image downloaded from url")
         sut.loadImageWithUrl(fakeUrl) {
             XCTAssertTrue(self.sut.isPlaceHolder)
             expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
}



