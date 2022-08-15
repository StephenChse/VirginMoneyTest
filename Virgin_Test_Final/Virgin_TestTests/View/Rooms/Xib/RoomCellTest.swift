//
//  RoomCellTest.swift
//  Virgin_TestTests
//
//  Created by Chase on 15/08/2022.
//

import XCTest
@testable import Virgin_Test

class RoomCellTest: XCTestCase {

    var sut: RoomCell!
    override func setUpWithError() throws {
        try super.setUpWithError()
        let bundle = Bundle(for: type(of: self))
        guard let cell = bundle.loadNibNamed("\(RoomCell.self)", owner: nil)?.first as? RoomCell else {
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
        guard let mockRoom = MockRoomsData().getRoomsDataFromFile()?.first else {
            return
        }
        let roomViewModel = RoomDataItemViewModel(mockRoom)
        sut.setData(roomViewModel)
        
        XCTAssertEqual(roomViewModel.roomID, "Room Id - " + (mockRoom.id ?? ""))
        XCTAssertEqual(roomViewModel.isOccupy, mockRoom.isOccupied)
        
        XCTAssertEqual(roomViewModel.idAccessibilityLabel, "Room Id - " + (mockRoom.id ?? ""))
        XCTAssertEqual(roomViewModel.isOccupyAccessibilityLabel, (mockRoom.isOccupied ?? false) ? "Occupied" : "Available")
    }
}
