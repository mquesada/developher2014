//
//  AppDelegate.swift
//  DevelopHer2014
//
//  Created by Maricel Quesada on 11/14/14.
//  Copyright (c) 2014 Maricel-Betsy-Cindy-Alexa-Diana. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {
    
    var window: UIWindow?
    var locationManager : CLLocationManager!
    var storyboard = UIStoryboard (name: "Main", bundle: nil)

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()
        
        Parse.setApplicationId("6RJu3SH5YkYeAmkRuBSFYlVQDwsh9ssdIWmoHJUZ", clientKey: "OXrovYrxJfmQpEP4cWjgNllk3rmc6PqCjqKDAvCq")

        customizeUI()
        if PFUser.currentUser() != nil   {
            //go to logged in view
            println ("current is logged in as \(PFUser.currentUser().username!)")
            var nvc = storyboard.instantiateViewControllerWithIdentifier("MainNavigationController") as UINavigationController
            window?.rootViewController = nvc
        } else {
            println("no current user")
        }

        return true
    }
    
    //App-wide UI customization (i.e. Navigation bar color, button color, etc
    
    func customizeUI(){
        
        //Navigation title font R:264 G:142 B:86
        let titleColorDictionary: NSDictionary = [NSForegroundColorAttributeName:UIColor(red: 246/255, green: 142/255, blue: 86/255, alpha: 1)]
        UINavigationBar.appearance().titleTextAttributes = titleColorDictionary
        //Navigation item font R:253 G:193 B:47
        UINavigationBar.appearance().tintColor = UIColor(red: 253/255, green: 193/255, blue: 47/255, alpha: 1)
        //Navigation bar R:136 G:120 B:105
        UINavigationBar.appearance().barTintColor = UIColor(red: 120/255, green: 106/255, blue: 93/255, alpha: 1)
        //Regular buttons background R:122 G:192 B:201
        UIButton.appearance().tintColor = UIColor.whiteColor()
        UIButton.appearance().backgroundColor = UIColor(red: 122/255, green: 192/255, blue: 168/201, alpha: 1)
        UILabel.appearance().textColor = UIColor(red: 136/255, green: 120/255, blue: 105/255, alpha: 1)
        
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
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var location = manager.location
        println("got location")
        
        var userLocation = UserLocation.sharedInstance
        userLocation.latitude = location.coordinate.latitude
        userLocation.longitude = location.coordinate.longitude
                
        self.locationManager.stopUpdatingLocation()
        
        var delay = dispatch_time(DISPATCH_TIME_NOW, Int64(600 * Double(NSEC_PER_SEC)))
        dispatch_after(delay, dispatch_get_main_queue()) { () -> Void in
            self.locationManager.startUpdatingLocation()
        }

    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error while updating location " + error.localizedDescription)
    }

}

