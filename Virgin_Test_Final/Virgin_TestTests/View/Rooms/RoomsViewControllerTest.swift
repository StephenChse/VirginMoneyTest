//
//  RoomsViewControllerTest.swift
//  Virgin_TestTests
//
//  Created by Chase on 15/08/2022.
//

import XCTest
@testable import Virgin_Test

class RoomsViewControllerTest: XCTestCase {

    var sut: RoomsViewController!
    override func setUpWithError() throws {
        let roomVC = UIStoryboard(name: "Room", bundle: nil).instantiateViewController(withIdentifier: "RoomsViewController") as? RoomsViewController
        sut = roomVC
        sut.tableView = sut.tableView
        sut.refreshControl = sut.refreshControl
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testViewDidLoad() throws {
        XCTAssertNotNil(sut.viewDidLoad())
    }
    
    func testFetchDataLoad() {
        sut.fetchDataAndLoad()
        sleep(2)
        XCTAssertGreaterThan(sut.viewModel.roomCount, 0)
    }
}


