//
//  ColleaguesViewControllerTest.swift
//  Virgin_TestTests
//
//  Created by Chase on 15/08/2022.
//

import XCTest
@testable import Virgin_Test

class StaffViewControllerTest: XCTestCase {
    
    var sut: StaffViewController!
    override func setUpWithError() throws {
        let colleagueVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StaffViewController") as? StaffViewController
        sut = colleagueVC
        
        sut.tableView = sut.tableView
        sut.refreshControl = sut.refreshControl
        _ = sut.view
        sut.loadView()
        sut.viewDidLoad()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testViewDidLoad() throws {
        XCTAssertNotNil(sut.viewDidLoad())
    }
    
    func testFetchDataLoad() {
        sut.fetchDataAndLoad()
        sleep(2)
        XCTAssertGreaterThan(sut.viewModel.staffCount, 0)
    }
    
    func testHasATableView() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(sut.tableView.delegate)
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:didSelectRowAt:))))
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
    }
    
//    func testTableViewCellHasReuseIdentifier() {
//        let cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! StaffCell
//        let actualReuseIdentifer = cell.reuseIdentifier
//           let expectedReuseIdentifier = "StaffCell"
//           XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
//       }
    
}
