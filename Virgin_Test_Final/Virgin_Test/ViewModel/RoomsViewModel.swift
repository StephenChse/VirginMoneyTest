//
//  RoomsViewModel.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//

import Foundation
import Combine

class RoomsViewModel {
    @Published var objRoomList = [Room]()
    var wsProtocol: WebServiceHandler?
    var roomCount: Int {
        return objRoomList.count
    }
    
    init(wsProtocol: WebServiceHandler = WebServiceHandler()) {
        self.wsProtocol = wsProtocol
    }
    
    func apiGetRooms() {
        LoadingView.display(true)
        wsProtocol?.getWebService(wsMethod: Endpoints.rooms.url) { result in
            switch result {
            case .success(let data):
                do {
                    let dataList: [Room] = try JSONDecoder().getType(from: data)
                    self.objRoomList = dataList
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
  
    func cellViewModel(at indexPath: IndexPath) -> RoomDataItem {
        return RoomDataItemViewModel(objRoomList[indexPath.row])
    }
}

protocol RoomDataItem {
    init(_ room: Room)
    var createdDate: String { get }
    var roomID: String { get }
    var isOccupy: Bool { get }
    var isOccupyText: String { get }
    var maxOccupacy: Int { get }
    var isOccupyAccessibilityLabel: String { get }
    var idAccessibilityLabel: String { get }
}

struct RoomDataItemViewModel: RoomDataItem {
    private let room: Room
    
    init(_ room: Room) {
        self.room = room
    }
    
    var createdDate: String {
        return (room.createdAt ?? "").dateConvert(outPutFormat: "dd-MM-yyyy")
    }
    
    var roomID: String {
        return "Room Id - " + (room.id ?? "")
    }
    
    var isOccupyText: String {
        return (room.isOccupied ?? false) ? "Occupied" : "Available"
    }
    
    var isOccupy: Bool {
        return room.isOccupied ?? false
    }
    
    var maxOccupacy: Int {
        return room.maxOccupancy ?? 0
    }
    
    var isOccupyAccessibilityLabel: String {
        return isOccupyText
    }
    
    var idAccessibilityLabel: String {
        return roomID
    }
}
