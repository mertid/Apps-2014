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
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversation.count
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableview.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = conversation[indexPath.row]["content"] as? String
        
        
        return cell
        
    }
    
    
    
    
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewWillAppear(animated: Bool) {
      
        super.viewWillAppear(animated)
        
        //conversation = defaults.arrayForKey(friend.username) as [PFObject]!
        
        var messageQuery = PFQuery(className: "Message")
       
        
        var possibleRelations = [PFUser.currentUser().username + friend.username, friend.username + PFUser.currentUser().username]
        
        
            messageQuery.findObjectsInBackgroundWithBlock {
        
            (messages: [AnyObject]!, error: NSError!) -> Void in
            println("Loaded \(messages.count) messages")
            if messages.count > 0 {
                self.conversation = messages as [PFObject]
                self.tableview.reloadData()
            }
        
        }
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
   
        
        
        formHolder.frame.origin.y = UIScreen.mainScreen().bounds.size.height - 281
        

    
    }
   
  func textFieldShouldReturn(textField: UITextField) -> Bool {
            self.sendMessage(textField)
            return true
    
    }
    
    
    @IBAction func sendMessage(sender: AnyObject) {
   
        
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
        
        var push = PFPush()
        push.setMessage(messageField.text)
        push.setQuery(deviceQuery)
        push.setData(NSDictionary(object: friend, forKey: "sender"))
        push.sendPushInBackground()
        
    
        messageField.resignFirstResponder()
        messageField.text = ""

    }
   
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

