//
//  StaffViewController.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//

import UIKit
import Combine
class StaffViewController: UIViewController, CustomViewController {
    
    //MARK: Outlet and Variable
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
            tableView?.register(UINib(nibName: Xib.staffCell, bundle: nil), forCellReuseIdentifier: StaffCell.reuseidentifier)
            tableView?.addSubview(refreshControl)
            tableView?.alwaysBounceVertical = false
        }
    }
    
    @IBOutlet weak var txtSearch: UITextField! {
        didSet {
            txtSearch.accessibilityLabel = "textFieldSearch"
            txtSearch.delegate = self
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
    
    private var cancellables: Set<AnyCancellable> = []
    
    var viewModel = StaffViewModel()
    
    //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        fetchDataAndLoad()
    }
    
    //MARK: Methods
    func fetchDataAndLoad() {
        self.viewModel.apiGetStaff()
    }
    
    func bindViewModel() {
        viewModel.$staffList.sink { staffList in
            print(staffList)
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                self.tableView?.reloadData()
            }
        }.store(in: &cancellables)
    }
    
    //MARK: refresh- To Refreh tableview
    @objc func refresh(_ sender: AnyObject) {
        self.viewModel.apiGetStaff()
    }
}


//MARK: TextField Delegate
extension StaffViewController: UITextFieldDelegate {
    @IBAction func valueChange(_ sender: UITextField) {
        viewModel.filterData(serchText: sender.text!) { [weak self] isSuccess in
            self?.tableView.reloadData()
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: Tableview Delegate and DataSource
extension StaffViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.staffCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: StaffCell = tableView.dequeueReusableCell(for: indexPath)
        let staffDataItem = viewModel.cellViewModel(at: indexPath)
        cell.setData(staffDataItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let staffDataItem = viewModel.cellViewModel(at: indexPath)
        let detailView : StaffDetailViewController = UIStoryboard.main.instantiateViewController()
        detailView.setTitle(AppString.detail.capitalized)
        detailView.staffDetails = staffDataItem
        navigationController?.pushViewController(detailView, animated: true)
    }
}

