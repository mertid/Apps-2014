//
//  FirstViewController.swift
//  tokens
//
//  Created by Merritt Tidwell on 10/1/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

let API_URL = "https://api.foursquare.com/v2/"

let CLIENT_ID = "ALWCHUNQNTOEAPJ2S3D1SQA13XXHS3MKWZZ4ZUAXKMX15B2P"

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func foursquareConnect(sender: AnyObject) {
   
        let AUTH_URL = "https://foursquare.com/oauth2/authenticate?client_id=" + CLIENT_ID + "&response_type=token&redirect_uri=tokens://tokens.com"
        
        UIApplication.sharedApplication().openURL(NSURL(string: AUTH_URL))
        
    
    }
 
    @IBAction func findLocations(sender: AnyObject) {
    }

    @IBAction func findWaldo(sender: AnyObject) {
    }
}

