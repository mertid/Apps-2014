//
//  ViewController.swift
//  Lets Be Friends
//
//  Created by Merritt Tidwell on 8/27/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var loginHolder = UIView()
    var signUpHolder = UIView()
    var buttonsHolder = UIView ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var signupButton = UIButton (frame: CGRectMake(10, 10, 145, 40))
        
        signupButton.setTitle("signup", forState: .Normal)
        signupButton.backgroundColor = UIColor.redColor()
        signupButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        signupButton.addTarget(self, action: Selector("showSignUp"), forControlEvents: .TouchUpInside)
        self.view.addSubview(signupButton)
        
        var loginButton = UIButton (frame: CGRectMake(165, 10, 145, 40))
        loginButton.setTitle("login", forState: .Normal)
        loginButton.backgroundColor = UIColor.blueColor()
        loginButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        loginButton.addTarget(self, action:Selector ("showLogIn"), forControlEvents: .TouchUpInside)
        self.view.addSubview(loginButton)
        
        Parse.setApplicationId("Vs7IjCMSjlbHErBCJHF2TOLCbMfmsqDmOcO2FLwr", clientKey: "wc9zzH2gzTrftpHvjs5tRM9Syn64DVt8uG08ssJM")
    }
    
    func showLogIn(){
        signUpHolder.removeFromSuperview()
        loginHolder.frame = self.view.frame
        
        var usernameField = UITextField(frame: CGRectMake(10, 200, 300, 40))
        usernameField.placeholder = "Username"
        loginHolder.addSubview(usernameField)
        
        var passwordField = UITextField(frame: CGRectMake(10, 250, 300, 40))
        passwordField.secureTextEntry = true
        passwordField.placeholder = "Password"
        
        loginHolder.addSubview(passwordField)
        
        var submitLogin = UIButton (frame: CGRectMake(10, 300, 300, 40))
        submitLogin.setTitle("submit", forState: .Normal)
        submitLogin.backgroundColor = UIColor.lightGrayColor()
        submitLogin.addTarget(self, action: Selector("login"), forControlEvents: .TouchUpInside)
        
        loginHolder.addSubview(submitLogin)
        
        fieldData =
            [
                "Username":usernameField,
                "Password":passwordField,
        ]
        
        
        self.view.addSubview(loginHolder)
        
    }
    
    func showSignUp(){
        
        var emailField = UITextField(frame: CGRectMake(10, 150, 300, 40))
        
        emailField.placeholder = "Email"
        signUpHolder.addSubview(emailField)
        
        signUpHolder.frame = self.view.frame
        
        var usernameField = UITextField(frame: CGRectMake(10, 200, 300, 40))
        
        usernameField.placeholder = "Username"
        signUpHolder.addSubview(usernameField)
        
        var passwordField = UITextField(frame: CGRectMake(10, 250, 300, 40))
        
        passwordField.secureTextEntry = true
        passwordField.placeholder = "Password"
        
        signUpHolder.addSubview(passwordField)
        
        var submitSignup = UIButton (frame: CGRectMake(10, 300, 300, 40))
        
        submitSignup.setTitle("submit", forState: .Normal)
        submitSignup.backgroundColor = UIColor.lightGrayColor()
        submitSignup.addTarget(self, action: Selector("signup"), forControlEvents: .TouchUpInside)
        
        
        
        signUpHolder.addSubview(submitSignup)
        
        fieldData =
            [
                "Email":emailField,
                "Username":usernameField,
                "Password":passwordField,
        ]
        
        
        self.view.addSubview(signUpHolder)
        
    }
    
    var fieldData: [String:UITextField]!
    
    func login(){
        
        PFUser.logInWithUsernameInBackground(fieldData["Username"]!.text,
            password: fieldData["Password"]!.text, block: { (user: PFUser!, error: NSError!) -> Void in
                
                self.loginHolder.removeFromSuperview()
                
                if user != nil {
                    println(user.objectForKey("team"))
                    
                    if user.objectForKey("team") == nil {
                        
                        self.showTeams()
                        
                    }
                    
                }else{
                    println(error)
                }
        })
    }
    
    func signup() {
        
        var user = PFUser()
        
        user.email = fieldData["Email"]!.text
        user.password = fieldData["Password"]!.text
        user.username = fieldData["Username"]!.text
        
        user.signUpInBackgroundWithBlock { (succeeded: Bool, error: NSError!) -> Void in
            
            if succeeded{
                println("you are logged in")
                self.signUpHolder.removeFromSuperview()
                self.showTeams()
                
            }else{
                println(error)
            }
        }
    }
    
    var teamHolder = UIView ()
    let halfHeight = UIScreen.mainScreen().bounds.size.height/2.0
    
    func showTeams(){
        
        teamHolder.frame = self.view.frame
        
        var redTeam = UIButton(frame: CGRectMake(0, 0, 320, halfHeight))
        
        redTeam.backgroundColor = UIColor.redColor()
        redTeam.tag = 1
        redTeam.addTarget(self, action: Selector("chooseTeam"), forControlEvents: .TouchUpInside)
        teamHolder.addSubview(redTeam)
        
        var blueTeam = UIButton(frame: CGRectMake(0, halfHeight, 320, halfHeight))
        blueTeam.backgroundColor = UIColor.blueColor()
        blueTeam.addTarget(self, action: Selector("chooseTeam"), forControlEvents: .TouchUpInside)
        teamHolder.addSubview(blueTeam)
        
        self.view.addSubview(blueTeam)
    }
    
    func chooseTeam (teamButton:UIButton){
        
        var user = PFUser.currentUser()
        
        switch teamButton.tag {
        case 1 :
            user.setObject("red", forKey: "team")
        default:
            user.setObject("blue", forKey: "team")
        }
        
        user.saveInBackground()
        teamHolder.removeFromSuperview()
        self.attackMode()
    }
    func attackMode() {
            
           var installation = PFInstallation.currentInstallation()
           installation.setObject(PFUser.currentUser(), forKey: "user")
           installation.saveInBackground()
          
          var attackButton = UIButton(frame: CGRectMake(10, 200, 300, 40))
           attackButton.setTitle("Attack", forState: .Normal)
           attackButton.backgroundColor = UIColor.blackColor()
           attackButton.addTarget(self, action: Selector("attack"), forControlEvents: .TouchUpInside)
          self.view.addSubview(attackButton)
       }
          
        func attack() {
        var user = PFUser.currentUser()
        var otherTeam = (user.objectForKey("team") as String == "red") ? "blue" : "red"
        var userQuery = PFQuery(className: "User")
    
         //TODO look up why String not NSString what other classes changed too?
         userQuery.whereKey("team", equalTo: otherTeam)
                
        var deviceQuery = PFInstallation.query()
        deviceQuery.whereKey("user", matchesQuery:userQuery)
       
        var push = PFPush()
         push.setQuery(userQuery)
            // so it'll only send the push to the users who match our query!
            // TODO try to do advanced targeting...
            // or add a query to the push ... so it only sends out to specific users
           push.setMessage("You have been attacked")
           push.sendPushInBackground()
    

}
        var userQuery = PFQuery (className: "User")
    userQuery.
    
    
    
}
