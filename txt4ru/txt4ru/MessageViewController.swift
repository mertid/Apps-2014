//
//  ViewController.swift
//  txt4ru
//
//  Created by Merritt Tidwell on 9/10/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate{
                            
    @IBOutlet weak var formHolder: UIView!
    @IBOutlet weak var messageField: UITextField!
   
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    
    var friend: PFUser! {
        
        
        willSet(user){
            println()
        }
        
        didSet(user){
            println()
        }
    }
    
    var conversation : [PFObject] = []
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        tableview.dataSource = self
        
        tableview.delegate = self
        messageField.delegate = self
    
        var nc = NSNotificationCenter.defaultCenter()
        
        nc.addObserverForName("newMessage", object: nil, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification: NSNotification!) -> Void in
            
            var relationOption1 = PFUser.currentUser().username + self.friend.username
            var relationOption2 = self.friend.username + PFUser.currentUser().username
            var possibleRelations = [relationOption1, relationOption2]
            

            
            var messageQuery = PFQuery(className: "Message")
            
            messageQuery.whereKey("receiver", equalTo: PFUser.currentUser())
            messageQuery.whereKey("sender", equalTo: self.friend)
            messageQuery.limit = 1
            messageQuery.orderByDescending("createdAt")
            
            messageQuery.whereKey("relation", containedIn: possibleRelations)
            
            messageQuery.findObjectsInBackgroundWithBlock {
                
                (messages: [AnyObject]!, error: NSError!) -> Void in
                println("Loaded \(messages.count) messages")
                if messages.count > 0 {
                    self.conversation = messages as [PFObject]
                    self.tableview.reloadData()
                    
                    var indexPath = NSIndexPath(forRow: self.conversation.count - 1, inSection: 0)
                    
                    self.tableview.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated:false)
                    
                }
                
            }
            

    
        })
    
    
    
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversation.count
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        
        var cell = tableview.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath) as MessageCell
        
        cell.messageInfo = conversation[indexPath.row]
     
        
      //  cell.textLabel?.text = conversation[indexPath.row]["content"] as? String
        
        
        return cell
        
    }
    
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewWillAppear(animated: Bool) {
      
        super.viewWillAppear(animated)
        
        //conversation = defaults.arrayForKey(friend.username) as [PFObject]!
        
        var messageQuery = PFQuery(className: "Message")
       
        
        var possibleRelations = [PFUser.currentUser().username + friend.username, friend.username + PFUser.currentUser().username]
        
            messageQuery.whereKey("relation", containedIn: possibleRelations)
        
            messageQuery.orderByAscending("createdAt")
            messageQuery.findObjectsInBackgroundWithBlock {
            
            (messages: [AnyObject]!, error: NSError!) -> Void in
            println("Loaded \(messages.count) messages")
            if messages.count > 0 {
                self.conversation = messages as [PFObject]
                self.tableview.reloadData()
                
                var indexPath = NSIndexPath(forRow: self.conversation.count - 1, inSection: 0)
                
                self.tableview.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated:false)
                
            }
        
        }
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
   
        
        
        formHolder.frame.origin.y = SCREEN_HEIGHT - 281
        

    
    }
   
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    
    
            self.sendMessage(textField)
            return true
    
    }
    
    
    @IBAction func sendMessage(sender: AnyObject) {
   
        
        formHolder.frame.origin.y = SCREEN_HEIGHT - formHolder.frame.size.height
        
        
        var message = PFObject(className: "Message")
        message["sender"] = PFUser.currentUser()
        message["receiver"] = friend
        message["content"] = messageField.text
        message["relation"] = PFUser.currentUser().username + friend.username
        message["read"] = false
        
        conversation.append(message)
        
        message.saveInBackground()
        tableview.reloadData()
    
        var deviceQuery = PFInstallation.query()
     
        deviceQuery.whereKey("user", equalTo: friend)
//        
//        deviceQuery.findObjectsInBackgroundWithBlock { (devices: [AnyObject]!, error: NSError!) -> Void in
//            if devices.count > 0 {
//                
//                var badgeCount = (devices[0]as PFInstallation).badge
        
        
            var data = NSDictionary(objects: [self.messageField.text,self.friend,"Increment"], forKeys: ["alert","sender"])
                
                var push = PFPush()
                push.setQuery(deviceQuery)
                push.setData(data)
                push.sendPushInBackground()
                

    //                }
   


        messageField.resignFirstResponder()
        messageField.text = ""
   

}

}