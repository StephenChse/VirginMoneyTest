//
//  RoomViewModelTest.swift
//  Virgin_TestTests
//
//  Created by Chase on 15/08/2022.
//

import XCTest
@testable import Virgin_Test

class RoomViewModelTest: XCTestCase {
    
    var sut: RoomsViewModel!
    var mockRequestManager: MockServiceHandlerManager!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = RoomsViewModel()
        if let roomData = MockRoomsData().getRoomsDataFromFile() {
            sut.objRoomList = roomData
        }
        mockRequestManager = MockServiceHandlerManager()
    }

    override func tearDownWithError() throws {
        sut = nil
        mockRequestManager = nil
        try super.tearDownWithError()
    }
    
    func testApiFetchRooms() {
        mockRequestManager.responseType = .success
        mockRequestManager.getWebService(wsMethod: Endpoints.rooms.url) {data in
            XCTAssertNotNil(data)
        }
    }
    
    func testCellViewModelAtIndexPath() {
        let dataItem = sut.cellViewModel(at: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(dataItem.roomID)
    }
    
    func testRoomDataItem() {
        let dataItem = RoomDataItemViewModel(sut.objRoomList.first!)
        XCTAssertNotNil(dataItem.roomID)
        XCTAssertNotNil(dataItem.createdDate)
        XCTAssertNotNil(dataItem.isOccupy)
        XCTAssertNotNil(dataItem.isOccupyText)
        XCTAssertNotNil(dataItem.maxOccupacy)
        XCTAssertNotNil(dataItem.idAccessibilityLabel)
        XCTAssertNotNil(dataItem.isOccupyAccessibilityLabel)
    }
}
