//
//  HomeVC.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//

import UIKit

class HomeViewController: UIViewController, CustomViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    private let arrMenu = ["Staff", "Rooms"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        setTitle(AppString.directory)
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = UIColor(named: "ColPrimary")
    }
    
    func navigateToStaff() {
        let staffView: StaffViewController = UIStoryboard.main.instantiateViewController()
        staffView.setTitle(AppString.staff.capitalized)
        navigationController?.pushViewController(staffView, animated: true)
    }
    
    func navigateToRooms() {
        let roomsVC: RoomsViewController = UIStoryboard.room.instantiateViewController()
        roomsVC.setTitle(AppString.rooms.capitalized)
        navigationController?.pushViewController(roomsVC, animated: true)
    }
}

//MARK: Tableview Delegate and DataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = arrMenu[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            navigateToStaff()
        case 1:
            navigateToRooms()
        default:
            debugPrint("")
        }
    }
}
