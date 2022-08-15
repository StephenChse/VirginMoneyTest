//
//  RoomsViewControllerTest.swift
//  Virgin_TestTests
//
//  Created by Chase on 15/08/2022.
//

import XCTest
@testable import Virgin_Test

class HomeViewControllerTest: XCTestCase {

    var sut: HomeViewController!
    override func setUpWithError() throws {
        let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        sut = homeVC
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testViewDidLoad() throws {
        XCTAssertNotNil(sut.viewDidLoad())
    }
    
    func testSetUI() {
        sut.setUI()
        XCTAssertEqual(sut.title, AppString.directory)
    }
}


