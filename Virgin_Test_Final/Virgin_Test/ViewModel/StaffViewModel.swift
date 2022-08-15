//
//  StaffViewModel.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//

import Foundation
import Combine
import UIKit

class StaffViewModel {
    @Published var staffList = [Staff]()
    var tempStaffList = [Staff]()
    var wsProtocol: WebServiceHandlerProtocol?
    
    init(wsProtocol: WebServiceHandlerProtocol = WebServiceHandler()) {
        self.wsProtocol = wsProtocol
    }
        
    var staffCount: Int {
        return staffList.count
    }
    
    func apiGetStaff() {
        LoadingView.display(true)
        wsProtocol?.getWebService(wsMethod: Endpoints.staff.url) { result in
            switch result {
            case .success(let data):
                do {
                    let dataList: [Staff] = try JSONDecoder().getType(from: data)
                    self.staffList = dataList
                    self.tempStaffList = dataList
                    LoadingView.display(false)
                } catch {
                    debugPrint("Error while converting data into model", error.localizedDescription)
                    LoadingView.display(false)
                }
            case .failure(let apiError):
                LoadingView.display(false)
                print(apiError.localizedDescription)
            }
        }
    }
    
    func filterData(serchText: String, completion: @escaping (_ isSuccess: Bool)->Void) {
        staffList = serchText.count == 0 ? tempStaffList :  tempStaffList.filter { staffMember in
            (staffMember.firstName ?? "").lowercased().contains(serchText.lowercased())
        }
        completion(staffList.count > 0 ? true : false)
    }
    
    func cellViewModel(at indexPath: IndexPath) -> StaffDataItem {
        return StaffDataItemViewModel(staffList[indexPath.row])
    }
}


protocol StaffDataItem {
    
    init(_ project: Staff)
    
    var fullName: String { get }
    var createdDate: String { get }
    var firstName: String { get }
    var lastName: String { get }
    var email: String { get }
    var jobTitle: String { get }
    var favColor: String { get }
    var colleagueId: String { get }
    var fromName: String { get }
    var avatar: String { get }
    
    var dataTitle: String { get }
    var dataBody: String { get }
    var dataId: String { get }
    var dataToId: String { get }
    var dataFromId: String { get }
    var dataMeetingId: String { get }
    
    var nameAccessibilityLabel: String { get }
    var jobTitleAccessibilityLabel: String { get }
}

struct StaffDataItemViewModel: StaffDataItem {
    
    private let staff: Staff
     
    init(_ staff: Staff) {
        self.staff = staff
    }
    
    var fullName: String {
        return (staff.firstName ?? "") + " " + (staff.lastName ?? "")
    }
    
    var createdDate: String {
        return (staff.createdAt ?? "").dateConvert(outPutFormat: "dd-MM-yyyy")
    }
    
    var firstName: String {
        return staff.firstName ?? ""
    }
    
    var lastName: String {
        return staff.lastName ?? ""
    }
    
    var email: String {
        return staff.email ?? ""
    }
    
    var jobTitle: String {
        return staff.jobtitle ?? ""
    }
    
    var favColor: String {
        return staff.favouriteColor ?? ""
    }
    
    var avatar: String {
        return staff.avatar ?? ""
    }
    
    var colleagueId: String {
        return staff.id ?? ""
    }
    
    var fromName: String {
        return staff.fromName ?? ""
    }
     
    var dataTitle: String {
        return staff.data?.title ?? ""
    }
    
    var dataBody: String {
        return staff.data?.body ?? ""
    }
    
    var dataId: String {
        return staff.data?.id ?? ""
    }
    
    var dataToId: String {
        return staff.data?.toId ?? ""
    }
    
    var dataFromId: String {
        return staff.data?.fromId ?? ""
    }
    
    var dataMeetingId: String {
        return staff.data?.meetingid ?? ""
    }
    
    var nameAccessibilityLabel: String {
        return fullName
    }
    
    var jobTitleAccessibilityLabel: String {
        return jobTitle
    }
}
