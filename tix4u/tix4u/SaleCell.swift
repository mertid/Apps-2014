//
//  SaleCell.swift
//  tix4u
//
//  Created by Heidi Proske on 10/8/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

class SaleCell: UITableViewCell {
 
    @IBOutlet var ticketLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var sectionLable: UILabel!
    @IBOutlet var rowLabel: UILabel!
    @IBOutlet var sellerNameLabel: UILabel!
    @IBOutlet var profileImage: UIImageView!
  
    override init( style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
