//
//  DateAddition.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//

import Foundation

extension String {
    func dateConvert(outPutFormat: String) -> String {
        let dateFormatter = ISO8601DateFormatter()
        let dateFormatterOutput = DateFormatter()
        dateFormatter.formatOptions.insert(.withFractionalSeconds)
        dateFormatterOutput.dateFormat = outPutFormat
        
        guard let date = dateFormatter.date(from: self) else {
            return "N/A"
        }
        return dateFormatterOutput.string(from: date)
    }
}
