//
//  StaffDetailViewModel.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//

import Foundation

struct DetailsData {
    var key: String?
    var value: String?
}

class StaffDetailViewModel {
    var staffDataItem: StaffDataItem!
    var detailsData: [DetailsData]!
    var dataCount: Int {
        return detailsData.count
    }
    
    init(staffDataItem: StaffDataItem) {
        self.staffDataItem = staffDataItem
        self.detailsData = [DetailsData]()
        self.createDataSource()
    }
    
    func createDataSource() {
        self.detailsData.append(DetailsData(key: "First Name", value: self.staffDataItem.firstName))
        self.detailsData.append(DetailsData(key: "Last Name", value: self.staffDataItem.lastName))
        self.detailsData.append(DetailsData(key: "Email Name", value: self.staffDataItem.email))
        self.detailsData.append(DetailsData(key: "Job Title Name", value: self.staffDataItem.jobTitle))
        self.detailsData.append(DetailsData(key: "ID", value: self.staffDataItem.colleagueId))
        self.detailsData.append(DetailsData(key: "Favorite Color", value: self.staffDataItem.favColor))
        self.detailsData.append(DetailsData(key: "Ceated Date", value: self.staffDataItem.createdDate))
        if self.staffDataItem.dataToId != "" {
            self.detailsData.append(DetailsData(key: "Current State", value: self.staffDataItem.dataTitle + " " + self.staffDataItem.dataBody))
        }
    }
    
    func cellViewModel(at indexPath: IndexPath) -> DetailsData {
        return detailsData[indexPath.row]
    }
}
