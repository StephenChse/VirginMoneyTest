//
//  ColleaguesViewModelTest.swift
//  Virgin_TestTests
//
//  Created by Chase on 15/08/2022.
//

import XCTest
@testable import Virgin_Test

class StaffViewModelTest: XCTestCase {
    var sut: StaffViewModel!
    var mockRequestManager: MockServiceHandlerManager!
    var mockUrlSession: URLSession!
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockUrlSession = URLSession(configuration: .ephemeral)
        mockRequestManager = MockServiceHandlerManager()
        
        sut = StaffViewModel(wsProtocol: WebServiceHandler(session: mockUrlSession))
        if let staffData = MockStaffData().getStaffDataFromFile() {
            sut.tempStaffList = staffData
        }
    }

    override func tearDownWithError() throws {
        sut = nil
        mockRequestManager = nil
        try super.tearDownWithError()
    }
    
    func testFilterDataSeachNameFromDataSuccess() {
        sut.filterData(serchText: "valerie") { isSuccess in
            XCTAssertTrue(isSuccess)
        }
    }
    
    func testFilterDataSeachNameFromDataNotFound() {
        sut.filterData(serchText: "NotFoundString") { isSuccess in
            XCTAssertFalse(isSuccess)
        }
    }
    
    func testGetStaffMock() {
        sut.apiGetStaff()
    }
    
    func testApiFetchColleagues() {
        mockRequestManager.responseType = .success
        mockRequestManager.getWebService(wsMethod: Endpoints.staff.url) {data in
            XCTAssertNotNil(data)
        }
    }
    
    func testCellViewModelAtIndexPath() {
        sut.filterData(serchText: "magg") { [self] isSuccess in
            if isSuccess {
                let dataItem = sut.cellViewModel(at: IndexPath(row: 0, section: 0))
                XCTAssertNotNil(dataItem.colleagueId)
            }
        }
    }
    
    func testStaffDataItem() {
        let dataItem = StaffDataItemViewModel(sut.tempStaffList.first!)
        XCTAssertNotNil(dataItem.colleagueId)
        XCTAssertNotNil(dataItem.fullName)
        XCTAssertNotNil(dataItem.createdDate)
        XCTAssertNotNil(dataItem.firstName)
        XCTAssertNotNil(dataItem.lastName)
        XCTAssertNotNil(dataItem.email)
        XCTAssertNotNil(dataItem.jobTitle)
        XCTAssertNotNil(dataItem.favColor)
        XCTAssertNotNil(dataItem.fromName)
        XCTAssertNotNil(dataItem.avatar)
        
        XCTAssertNotNil(dataItem.dataTitle)
        XCTAssertNotNil(dataItem.dataBody)
        XCTAssertNotNil(dataItem.dataId)
        XCTAssertNotNil(dataItem.dataToId)
        XCTAssertNotNil(dataItem.dataFromId)
        XCTAssertNotNil(dataItem.dataMeetingId)
        XCTAssertNotNil(dataItem.nameAccessibilityLabel)
        XCTAssertNotNil(dataItem.jobTitleAccessibilityLabel)
    }
}
