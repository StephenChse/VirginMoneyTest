//
//  RoomsVC.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//

import UIKit
import Combine
class RoomsViewController: UIViewController, CustomViewController {

    //MARK: Outlet and Variable
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView?.register(UINib(nibName: Xib.roomCell, bundle: nil), forCellReuseIdentifier: RoomCell.reuseidentifier)
            tableView?.addSubview(refreshControl)
            tableView?.alwaysBounceVertical = false
        }
    }
        
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
                                    #selector(refresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.gray
        return refreshControl
    }()
    
    var viewModel = RoomsViewModel()
    var cancle: Set<AnyCancellable> = []
    
    //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        fetchDataAndLoad()
    }
    
    //MARK: Methods
    func bindViewModel() {
        self.viewModel.$objRoomList.sink { [weak self]  rooms in
            DispatchQueue.main.async {
                self?.refreshControl.endRefreshing()
                self?.tableView?.delegate = self
                self?.tableView?.dataSource = self
                self?.tableView?.reloadData()
            }
        }.store(in: &cancle)
    }
    
   func fetchDataAndLoad() {
       self.viewModel.apiGetRooms()
    }
    
    //MARK: To Refreh Tableview
    @objc func refresh(_ sender: AnyObject) {
        self.viewModel.apiGetRooms()
    }
}

//MARK: Tableview Delegate and DataSource
extension RoomsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.roomCount
    }
    
    /// Fetch all data from the server and set into tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RoomCell = tableView.dequeueReusableCell(for: indexPath)
        let roomDataItem = viewModel.cellViewModel(at: indexPath)
        cell.setData(roomDataItem)
        return cell
    }
}
