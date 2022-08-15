//
//  Staff.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//

import Foundation

// MARK: - Model
struct Staff: Codable {
    let createdAt: String?
    let firstName: String?
    let avatar: String?
    let lastName: String?
    let email: String?
    let jobtitle: String?
    let favouriteColor: String?
    let id: String?
    let data: ResponseData?
    let to: String?
    let fromName: String?
}

struct ResponseData: Codable {
    let title: String?
    let body: String?
    let toId: String?
    let id: String?
    let fromId: String?
    let meetingid: String?
}
