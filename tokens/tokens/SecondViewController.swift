//
//  SecondViewController.swift
//  tokens
//
//  Created by Merritt Tidwell on 10/1/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let API_URL = "https://api.instagram.com/v1"
    let CLIENT_ID = "147a7f79ac81480ca924393827fa0cf7"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func instaConnect(sender: AnyObject) {
   
    let AUTH_URL = "https://instagram.com/oauth/authorize/?client_id=" + CLIENT_ID + "&redirect_uri=tokens://tokens.com&response_type=token"
        

    
    }
   
    
    
    @IBAction func myFeed(sender: AnyObject) {
    
    instaRequest("users/search", parameter: "count=5")
    
    }
    
    @IBAction func findWaldo(sender: AnyObject) {
  
        instaRequest("users/search", parameter: "q=waldo")
    
    }
    
    
    
    func instaRequest(endpoint: String, parameter: String) {
    
    var request = NSURLRequest(URL: NSURL(string: API_URL + endpoint + "?access_token=" + FS_TOKEN + "&" + parameter))
    
    println(request.URL.absoluteString)
    
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            
            
            var resultInfo = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: nil) as [String:AnyObject]
            
            
            var igTVC =  self.storyboard?.instantiateViewControllerWithIdentifier("instaTVC") as IGTableViewController
            
            igTVC.items = resultInfo["data"]! as [AnyObject]
            
            
            self.presentViewController(igTVC, animated:true, completion:nil)
        
    println(resultInfo)
    
    //                var sb = UIStoryboard(name: "Main", bundle: nil)
    //
    //            var fsTVC = self.storyboard?.instantiateViewControllerWithIdentifier("foursquareTVC") as FSTableViewController
    //
    //            fsTVC.items = resultInfo["response"]!["venues"]! as NSArray
    //
    //            self.presentViewController(fsTVC, animated: true, completion: nil)
    
    }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

