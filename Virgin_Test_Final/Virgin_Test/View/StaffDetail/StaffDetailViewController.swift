//
//  StaffDetailViewController.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//

import UIKit

class StaffDetailViewController: UIViewController, CustomViewController {

    var staffDetails: StaffDataItem?
    var viewModel: StaffDetailViewModel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView?.register(UINib(nibName: Xib.staffDetailCell, bundle: nil), forCellReuseIdentifier: StaffDetailCell.reuseidentifier)
            tableView?.estimatedRowHeight = 44.0
            tableView?.alwaysBounceVertical = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let detail = staffDetails {
            viewModel = StaffDetailViewModel(staffDataItem: detail)
        }
    }
}
//MARK: Tableview Delegate and DataSource
extension StaffDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: StaffDetailCell =  tableView.dequeueReusableCell(for: indexPath)
        cell.setData(viewModel.cellViewModel(at: indexPath))
        return cell
    }
}



