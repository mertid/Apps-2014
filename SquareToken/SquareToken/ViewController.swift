//
//  ViewController.swift
//  SquareToken
//
//  Created by Merritt Tidwell on 9/30/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

// https://foursquare.com/oauth2/authenticate?client_id=ALWCHUNQNTOEAPJ2S3D1SQA13XXHS3MKWZZ4ZUAXKMX15B2P&response_type=token&redirect_uri=http://www.merritt.io

import UIKit


class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
  
        UIApplication.sharedApplication().openURL(NSURL(string: "https://foursquare.com/oauth2/authenticate?client_id=ALWCHUNQNTOEAPJ2S3D1SQA13XXHS3MKWZZ4ZUAXKMX15B2P&response_type=token&redirect_uri=http://www.merritt.io"))
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

