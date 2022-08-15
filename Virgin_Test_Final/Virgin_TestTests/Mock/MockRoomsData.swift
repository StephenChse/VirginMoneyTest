//
//  MockData.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//

import Foundation
@testable import Virgin_Test
import XCTest

class MockRoomsData {
    func getRoomsDataFromFile() -> [Room]? {
        let jsonData = dataFromJSON(withName: "Rooms")!
        do {
            let roomList: [Room] = try JSONDecoder().getType(from: jsonData)
            return roomList
        } catch {
            return nil
        }
    }
}
