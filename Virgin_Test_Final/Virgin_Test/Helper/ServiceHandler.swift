//
//  WebServiceHandler.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//


import Foundation

enum Endpoints : String {
    static let BaseURL =  "https://\(Bundle.main.object(forInfoDictionaryKey: "BASE_URL_VM") ?? "")"
    case staff = "people"
    case rooms = "rooms"
    
    var url : URL {
        get{
            return URL(string: Endpoints.BaseURL + self.rawValue)! 
        }
    }
}

enum APIError: Error {
    case error(Error)
    case noData
    case invalidResponseCode(Int)
}

protocol WebServiceHandlerProtocol {
    func getWebService(wsMethod: URL, complete:@escaping (Result<Data, APIError>) -> Void)
}



class WebServiceHandler: WebServiceHandlerProtocol {

    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func getWebService(wsMethod: URL, complete:@escaping (Result<Data, APIError>) -> Void) {
    
        let request = URLRequest(url: wsMethod)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            if let error = error {
                complete(.failure(.error(error)))
            }
            
            guard let data = data else {
                complete(.failure(.noData))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200...299:
                    complete(.success(data))
                default:
                    print("Err Status Code: \(response.statusCode)")
                    complete(.failure(.invalidResponseCode(response.statusCode)))
                }
            }
        })
        task.resume()
    }
}

