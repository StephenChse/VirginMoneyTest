//
//  SeviceHandlerTests.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//

import Foundation
@testable import Virgin_Test
import XCTest

enum ResponseType {
    case error
    case success
}

class MockServiceHandlerManager: WebServiceHandlerProtocol {
    var responseType: ResponseType = .success
    func getWebService(wsMethod: URL, complete: @escaping (Result<Data, APIError>) -> Void) {
        switch responseType {
        case .error:
            complete(.failure(.noData))
        case .success:
            var jsonData: Data?
            switch wsMethod {
            case Endpoints.staff.url:
                jsonData = dataFromJSON(withName: "Staff")!
            case Endpoints.rooms.url:
                jsonData = dataFromJSON(withName: "Rooms")!
            default:
                print("")
            }
            
            guard let jsonData = jsonData else {
                complete(.failure(.noData))
                return
            }
            
            complete(.success(jsonData))
        }
    }
}
