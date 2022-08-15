//
//  MockStaffData.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//

import Foundation
@testable import Virgin_Test
import XCTest

class MockStaffData {
   
    func getStaffDataFromFile() -> [Staff]? {
        
        let jsonData = dataFromJSON(withName: "Staff")!
        do {
            let staffList: [Staff] = try JSONDecoder().getType(from: jsonData)
            return staffList
        } catch {
            return nil
        }
    }
}

func dataFromJSON(withName name: String) -> Data? {
    guard let fileURL = Bundle(for: Virgin_TestTests.self).url(forResource: name, withExtension: "json") else {
        return nil
    }
    return try? Data(contentsOf: fileURL)
}
