//
//  TweetLocTVC.swift
//  LoWeet
//
//  Created by Merritt Tidwell on 9/15/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

class TweetLocTVC: UITableViewCell {

    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var locationLabel: UILabel!
   
    
    @IBAction func editTweetLocation(sender: AnyObject) {
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
