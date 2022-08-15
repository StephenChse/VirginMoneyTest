//
//  ColleagueDetailViewModelTest.swift
//  Virgin_TestTests
//
//  Created by Chase on 15/08/2022.
//

import XCTest
@testable import Virgin_Test

class StaffDetailViewModelTest: XCTestCase {
    var sut: StaffDetailViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let dataItem = StaffDataItemViewModel(Staff(createdAt: "2022-01-24T17:02:23.729Z",
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
        
        sut = StaffDetailViewModel(staffDataItem: dataItem)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testCreateDateSource() {
        sut.createDataSource()
        XCTAssertNotNil(sut.detailsData.first)
    }
    
    func testCellViewModelAtIndexPath() {
        sut.createDataSource()
        XCTAssertNotNil(sut.cellViewModel(at: IndexPath(row: 0, section: 0)))
    }
}
