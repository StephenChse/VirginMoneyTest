//
//  Project.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//

import Foundation
import UIKit

class RoomCell: UITableViewCell {
    // MARK: Outlets
    @IBOutlet weak private var lblRoomId: UILabel!
    @IBOutlet weak private var lblDate: UILabel!
    @IBOutlet weak private var lblOccupied: UILabel!
    static let reuseidentifier = "RoomCell"
    
    /// set room data
    func setData(_ dataItem: RoomDataItem) {
        lblRoomId.text = dataItem.roomID
        lblDate.text = dataItem.createdDate
        lblOccupied.text = dataItem.isOccupyText
        lblOccupied.textColor = dataItem.isOccupy ? .red : .green
        applyAccessibility(dataItem)
        selectionStyle = .none
    }
}

extension RoomCell {
    func applyAccessibility(_ dataItem: RoomDataItem) {
        lblRoomId.accessibilityLabel = dataItem.idAccessibilityLabel
        lblOccupied.accessibilityLabel = dataItem.isOccupyAccessibilityLabel
  }
}
