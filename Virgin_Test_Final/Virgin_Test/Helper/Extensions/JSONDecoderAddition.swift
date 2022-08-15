//
//  JSONDecoderAddition.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//

import Foundation

extension JSONDecoder {
    func getType<T : Decodable>(from jsonData: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: jsonData)
    }
}
