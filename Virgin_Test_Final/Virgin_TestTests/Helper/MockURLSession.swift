//
//  MockURLSession.swift
//  Virgin_TestTests
//
//  Created by Chase on 15/08/2022.
//

import Foundation

typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
class MockingURLSession: URLSession {
    var data: Data?
    var error: Error?
    
    override func dataTask(
        with url: URL,
        completionHandler: @escaping CompletionHandler
    ) -> URLSessionDataTask {
        completionHandler(self.data, nil, self.error)
        
        return URLSessionDataTask()
    }
}
