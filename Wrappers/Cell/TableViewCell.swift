//
//  TableViewCell.swift
//  Wrappers
//
//  Created by Gaurav Tiwari on 10/12/18.
//  Copyright © 2018 Gaurav Tiwari. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblIndex: UILabel!
    
    var index: Int? {
        didSet {
            lblIndex.text = "\(index ?? 0)"
        }
    }
}
