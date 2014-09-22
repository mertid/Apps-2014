//
//  ViewController.swift
//  SwifterTweet
//
//
//

import UIKit
import SwifteriOS
import Social
import Accounts


class ViewController: UIViewController {

 
    var swifter = Swifter(consumerKey: "", consumerSecret: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let accountStore = ACAccountStore()
        let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        
        accountStore.requestAccessToAccountsWithType(accountType, options: nil) { (success: Bool, error: NSError!) -> Void in
            
            
            if success{
                
                let twitterAccounts = accountStore.accountsWithAccountType(accountType)
                
                for tAccount in twitterAccounts {
                
                    let tA = tAccount as ACAccount
                    
                //    println(tA.userFullName)
                    println(tA.username)
                    println(tA.accountDescription)
                    println(tA.credential)
                    println(tA.identifier)
                }
            

                let twitterAccount = twitterAccounts[0] as ACAccount
                self.swifter = Swifter(account: twitterAccount)

                self.swifter.postStatusUpdate("Im posting from an app I built with the new Swifter framework #ios #swift", inReplyToStatusID: nil, lat: nil, long: nil, placeID: nil, displayCoordinates: false, trimUser: true, success: { (status) -> Void in
                    
                    
                }, failure: { (error) -> Void in
                    
                })
                
                
                //               self.swifter.getStatusesHomeTimelineWithCount(5, sinceID: nil, maxID: nil, trimUser: true, contributorDetails: true, includeEntities: true, success: { (statuses) -> Void in
//                    
//                    println(statuses)
//                    
//                }, failure: { (error) -> Void in
//                    
//                })
                
  
                
                
                
                
            }
        }
    }
}

