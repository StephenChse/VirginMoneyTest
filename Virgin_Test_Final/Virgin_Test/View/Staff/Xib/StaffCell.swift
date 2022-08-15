//
//  Project.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//

import Foundation
import UIKit

class StaffCell: UITableViewCell {
    // MARK: Outlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblJobTitle: UILabel!
    @IBOutlet weak var imgViewProfile: ImageLoader! {
        didSet {
            imgViewProfile.layer.masksToBounds = true
            imgViewProfile.layer.cornerRadius = 25.0
        }
    }
    static let reuseidentifier = "StaffCell"
    
    func setData(_ dataItem: StaffDataItem) {
        lblName.text = dataItem.fullName
        lblJobTitle.text = dataItem.jobTitle
        if let imgUrl = URL(string: dataItem.avatar) {
            imgViewProfile.loadImageWithUrl(imgUrl) {}
        }
        applyAccessibility(dataItem)
        selectionStyle = .none
        accessoryType = .disclosureIndicator
    }
    
    func applyAccessibility(_ dataItem: StaffDataItem) {
        lblName.accessibilityLabel = dataItem.nameAccessibilityLabel
        lblJobTitle.accessibilityLabel = dataItem.jobTitleAccessibilityLabel
    }
}

