//
//  TableViewCell.swift
//  LiveIBViews
//
//  Created by Merritt Tidwell on 9/26/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet var mainLabel: UILabel!

    @IBOutlet var subLabel: UILabel!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
