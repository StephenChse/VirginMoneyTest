//
//  StaffCellTest.swift
//  Virgin_TestTests
//
//  Created by Chase on 15/08/2022.
//

import Foundation
import XCTest
@testable import Virgin_Test

class StaffCellTest: XCTestCase {

    var sut: StaffCell!
    override func setUpWithError() throws {
        try super.setUpWithError()
        let bundle = Bundle(for: type(of: self))
        guard let cell = bundle.loadNibNamed("\(StaffCell.self)", owner: nil)?.first as? StaffCell else {
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
        guard let mockColleague = MockStaffData().getStaffDataFromFile()?.first else {
            return
        }
        let collViewModel = StaffDataItemViewModel(mockColleague)
        sut.setData(collViewModel)
        
        XCTAssertEqual(collViewModel.colleagueId, mockColleague.id)
        XCTAssertEqual(collViewModel.firstName, mockColleague.firstName)
        XCTAssertEqual(collViewModel.jobTitle, mockColleague.jobtitle)
        XCTAssertEqual(collViewModel.email, mockColleague.email)
    }
}
