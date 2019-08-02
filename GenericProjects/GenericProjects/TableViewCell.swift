//
//  TableViewCell.swift
//  GenericProjects
//
//  Created by Aashwatth Agarwal on 8/1/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, NibRegister {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
