//
//  ViewController.swift
//  Wrappers
//
//  Created by Gaurav Tiwari on 22/11/18.
//  Copyright © 2018 Gaurav Tiwari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    var array: [Int] = Array(0...20)
    
    override func viewDidLoad() {
        tblView.register(cells: TableViewCell.self)
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if array.count == 0 {
            tableView.backgroundView = EmptyView.loadFromXIB()
        } else {
            tableView.backgroundView = nil
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewCell.dequeReusably(for: tableView, at: indexPath)
        cell.index = array[indexPath.row]
        return cell
    }
}
