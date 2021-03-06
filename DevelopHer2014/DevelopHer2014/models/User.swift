//
//  User.swift
//  DevelopHer2014
//
//  Created by Maricel Quesada on 11/14/14.
//  Copyright (c) 2014 Maricel-Betsy-Cindy-Alexa-Diana. All rights reserved.
//


var _currentUser: User?
var currentUserKey = "currentUser"
var userDidLoginNotification = "userDidLoginNotification"
var userDidLogoutNotification = "userDidLogoutNotification"

class User {
    
    var id: String!
    var firstName: String!
    var lastName: String!
    var profileImageUrl: String!
    var headline: String!
    var email: String!
    var industry: String!
    var data: NSDictionary!
    
    init(data: NSDictionary) {
        self.data = data
        
        self.id = data["id"] as String
        self.firstName = data["firstName"] as String
        self.lastName = data["lastName"] as String
        self.headline = data["headline"] as String
//        self.profileImageUrl = NSURL(string: data["pictureUrl"] as String)
        self.profileImageUrl = data ["pictureUrl"] as String
        
        self.email = data["emailAddress"] as String
        self.industry = data["industry"] as String
     }
    
    var location : UserLocation? {
        get {
            return UserLocation.sharedInstance
        }
    }
    
    class var currentUser: User? {
        get {
            if (_currentUser == nil) {
                var data = NSUserDefaults.standardUserDefaults().objectForKey(currentUserKey) as? NSData
                if (data != nil) {
                    var dict = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as NSDictionary
                    _currentUser  = User(data: dict)
                }
            }
            return _currentUser
        }
        set(user) {
            _currentUser = user
            
            if (_currentUser != nil) {
                var data = NSJSONSerialization.dataWithJSONObject(user!.data!, options: nil, error: nil)
                NSUserDefaults.standardUserDefaults().setObject(data, forKey: currentUserKey)
            } else {
                NSUserDefaults.standardUserDefaults().setObject(nil, forKey: currentUserKey)
            }
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    func logout() {
        User.currentUser = nil

        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: userDidLogoutNotification, object: nil))        
    }
    
    class func loginWithCompletion(completion: () -> Void) {
        
        LinkedInClient.sharedInstance.loginWithCompletion { (user, error) -> () in
            if (user != nil) {
                User.currentUser = user
                NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: userDidLoginNotification, object: nil))
                completion()
            } else {
                println(error)
            }
        }
    }
    
    class func isLoggedIn() -> Bool {
        return (currentUser != nil)
    }
    
    
}