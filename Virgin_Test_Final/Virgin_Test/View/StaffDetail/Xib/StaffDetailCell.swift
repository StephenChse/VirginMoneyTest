//
//  Project.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//

import Foundation
import UIKit

class StaffDetailCell: UITableViewCell {
    // MARK: Outlets
    @IBOutlet weak private var lblKey: UILabel!
    @IBOutlet weak private var lblValue: UILabel!
    
    static let reuseidentifier = "StaffDetailCell"
    
    func setData(_ details: DetailsData) {
        lblKey.text = details.key
        lblValue.text = details.value
        applyAccessibility(details)
        selectionStyle = .none
    }
    
    func applyAccessibility(_ details: DetailsData) {
        lblKey.accessibilityLabel = details.key
        lblValue.accessibilityLabel = details.value
    }
}

