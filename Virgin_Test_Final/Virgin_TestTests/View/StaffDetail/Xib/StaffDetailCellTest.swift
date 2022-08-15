//
//  ColleagueDetailCellTest.swift
//  Virgin_TestTests
//
//  Created by Chase on 15/08/2022.
//

import XCTest
@testable import Virgin_Test

class StaffDetailCellTest: XCTestCase {

    var sut: StaffDetailCell!
    override func setUpWithError() throws {
        try super.setUpWithError()
        let bundle = Bundle(for: type(of: self))
        guard let cell = bundle.loadNibNamed("\(StaffDetailCell.self)", owner: nil)?.first as? StaffDetailCell else {
            XCTFail("Unable to create cell")
            return
        }
        sut = cell
    }
    

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testSetData() throws {
        sut.setData(DetailsData(key: "First Name", value: "Test Name"))
        XCTAssertNotNil(sut)
    }
}

