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
  
    
        foursquareRequest("venues/search", parameter: "near=Buckhead,GA")
    }

    @IBAction func findWaldo(sender: AnyObject) {

    
    }

    func foursquareRequest(endpoint: String, parameter: String) {
        
        var request = NSURLRequest(URL: NSURL(string: API_URL + endpoint + "?oauth_token=" + FS_TOKEN + "&v=20141001" + parameter ))
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) -> Void in
        
            var resultInfo = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: nil) as [AnyObject]
            
            
            var fsTVC = self.storyboard?.instantiateViewControllerWithIdentifier("foursquareTVC") as FSTableViewController
            
            fsTVC.items = resultInfo
            
            self.presentViewController(fsTVC, animated: true, completion: nil)
    
            
        }
            
    }

}

