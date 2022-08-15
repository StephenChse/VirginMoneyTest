//
//  StaffDetailViewControllerTest.swift
//  Virgin_TestTests
//
//  Created by Chase on 15/08/2022.
//

import XCTest
@testable import Virgin_Test

class StaffDetailViewControllerTest: XCTestCase {

    var sut: StaffDetailViewController!
    override func setUpWithError() throws {
        let colleagueDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StaffDetailViewController") as? StaffDetailViewController
        sut = colleagueDetailsVC
        sut.tableView = sut.tableView
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testViewModel() {
        let mockDatatItem = StaffDataItemViewModel(
            Staff(createdAt: "2022-01-24T17:02:23.729Z",
                    firstName: "Maggie",
                    avatar: "https://randomuser.me/api/portraits/women/21.jpg",
                    lastName: "Brekke",
                    email: "Crystel.Nicolas61@hotmail.com",
                    jobtitle: "Future Functionality Strategist",
                    favouriteColor: "pink",
                    id: "1",
                    data: nil,
                    to: nil,
                    fromName: nil))
        
        let viewModel = StaffDetailViewModel(staffDataItem: mockDatatItem)
        XCTAssertEqual(viewModel.dataCount, 7)
    }
}

