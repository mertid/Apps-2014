//
//  AppDelegate.swift
//  txt4ru
//
//  Created by Merritt Tidwell on 9/10/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        Parse.setApplicationId("rJ2CePYfKz2YpcAUZy08cCFSDDF0XWr69O4ezUkq", clientKey: "m6pjGAQurlCvx9BLmHB1tJlEyPh4NeqUlewS5TR4")
            
        
        PFUser.enableAutomaticUser ()
        
        var installation = PFInstallation.currentInstallation()
            installation["user"] = PFUser.currentUser()
            installation.saveInBackground()
            
        var types = UIUserNotificationType.Sound | UIUserNotificationType.Badge | UIUserNotificationType.Alert
        
        var notificationSettings = UIUserNotificationSettings(forTypes: types, categories: nil)
        
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
        
        UIApplication.sharedApplication().applicationIconBadgeNumber = 2

            
        return true
  
        
    
    
    }

    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData)
    {
        var currentInstallation = PFInstallation.currentInstallation()
        currentInstallation.setDeviceTokenFromData(deviceToken)
        currentInstallation.saveInBackground()
    
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

